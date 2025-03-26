import UIKit



class DynamicFormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK: outlets
    private let mainCategoryDropdown = UITextField()
    private let subcategoryDropdown = UITextField()
    private let submitButton = UIButton(type: .system)
    private let tableView = UITableView()
    private var propertyDropdowns: [UITextField] = []
    private var propertyTextFields: [UITextField] = []
    private var selectedValues: [String: String] = [:]
    private var mainCategories: [Category] = []
    private var subcategories: [Property] = []
    private var properties: [Option] = []
    private var selectedMainCategory: Category?
    private var selectedSubcategory: Property?
    
    //MARK: views
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
        fetchData()
    }

    //MARK: functions
    private func setupUI() {
        mainCategoryDropdown.placeholder = "Select Main Category"
        mainCategoryDropdown.borderStyle = .roundedRect
        mainCategoryDropdown.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainCategoryDropdown)

        subcategoryDropdown.placeholder = "Select Subcategory"
        subcategoryDropdown.borderStyle = .roundedRect
        subcategoryDropdown.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subcategoryDropdown)

        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            mainCategoryDropdown.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainCategoryDropdown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainCategoryDropdown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            subcategoryDropdown.topAnchor.constraint(equalTo: mainCategoryDropdown.bottomAnchor, constant: 20),
            subcategoryDropdown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subcategoryDropdown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            submitButton.topAnchor.constraint(equalTo: subcategoryDropdown.bottomAnchor, constant: 300),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: subcategoryDropdown.bottomAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])

        setupDropdownPickers()
        setupToolbar()
    }
    
    private func setupToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPicker))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        mainCategoryDropdown.inputAccessoryView = toolbar
        subcategoryDropdown.inputAccessoryView = toolbar
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }

    private func setupDropdownPickers() {
        mainCategoryDropdown.inputView = createPickerView(tag: 0)
        subcategoryDropdown.inputView = createPickerView(tag: 1)
    }

    private func createPickerView(tag: Int) -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = tag
        return pickerView
    }

    private func fetchData() {
        // Replace with your actual data fetching logic
        // Example usage:

        let urlString = "https://stagingapi.mazaady.com/api/v1/all-categories/web" // This URL returns a JSON object representing a todo item.
        NetworkManager.getMainCategory(urlString: urlString) { responseData in
            for category in responseData!.data.categories {
                self.mainCategories.append(category)
                print("category",category)
               
            }
        }

    
    }

    
    private func fetchDataSubCategory(id:Int) {
        self.subcategories.removeAll()
        // Replace with your actual data fetching logic
        // Example usage:
        let urlString = "https://stagingapi.mazaady.com/api/v1/properties/\(id)" // This URL returns a JSON object representing a todo item.
        NetworkManager.getsubCategory(urlString: urlString, complete: { responseData in
            for property in responseData!.data {
                self.subcategories.append(property)
            
                
            }
        })

    }

    @objc private func submitForm() {
        tableView.reloadData()
    }

    private func generatePropertyFields(properties: [Option]) {
        propertyDropdowns.forEach { $0.removeFromSuperview() }
        propertyTextFields.forEach { $0.removeFromSuperview() }
        propertyDropdowns.removeAll()
        propertyTextFields.removeAll()
        var lastView: UIView = subcategoryDropdown
        for property in properties {
            let dropdown = UITextField()
            dropdown.placeholder = "Select \(property.name)"
            dropdown.borderStyle = .roundedRect
            dropdown.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dropdown)
            propertyDropdowns.append(dropdown)

            NSLayoutConstraint.activate([
                dropdown.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 10),
                dropdown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                dropdown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            lastView = dropdown
            dropdown.inputView = createPropertyPickerView(property: property, textField: dropdown)
            
            // Set tag and accessibilityIdentifier for later use.
            dropdown.tag = property.id
            dropdown.accessibilityIdentifier = property.name
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let otherButton = UIBarButtonItem(title: "Other", style: .plain, target: self, action: #selector(handleOther(sender:)))
            otherButton.tag = property.id // Tag the button with the property ID.
            toolbar.setItems([doneButton, spaceButton, otherButton], animated: false)
            dropdown.inputAccessoryView = toolbar

        }
    }
    
    @objc func handleOther(sender: UIBarButtonItem) {
        let propertyId = sender.tag
        if let propertyIndex = properties.firstIndex(where: { $0.id == propertyId }) {
            let property = properties[propertyIndex]
            
            // Find the corresponding text field, if it already exists.
            if let existingTextFieldIndex = propertyTextFields.firstIndex(where: { $0.tag == propertyId }) {
                //Remove existing text field.
                let existingTextField = propertyTextFields[existingTextFieldIndex]
                existingTextField.removeFromSuperview()
                propertyTextFields.remove(at: existingTextFieldIndex)
            }
            
            // Find the corresponding dropdown.
            if let dropdownIndex = propertyDropdowns.firstIndex(where: { $0.tag == propertyId }) {
                let dropdown = propertyDropdowns[dropdownIndex]
                
                let textField = UITextField()
                textField.placeholder = "Enter \(property.name) Value"
                textField.borderStyle = .roundedRect
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.tag = propertyId // Use the property ID as the tag.
                view.addSubview(textField)
                propertyTextFields.append(textField) // Store the text field.
                
                NSLayoutConstraint.activate([
                    textField.topAnchor.constraint(equalTo: dropdown.bottomAnchor, constant: 10),
                    textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                ])
                
                //Update lastView
                if let lastView = propertyTextFields.last {
                    
                }
                textField.becomeFirstResponder()
            }
            
        }
    }

    //MARK: pickerview

    private func createPropertyPickerView(property: Option, textField: UITextField) -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = property.id
        pickerView.accessibilityIdentifier = property.name
        return pickerView
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return mainCategories.count
        } else if pickerView.tag == 1 {
            return subcategories.count
        } else {
            return properties.count + 1 // +1 for "Other"
            
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return mainCategories[row].name
        } else if pickerView.tag == 1 {
            return subcategories[row].name
        } else {
            if properties.first(where: { $0.id == pickerView.tag }) != nil {
                if row < properties.count {
                    return properties[row].name
                } else {
                    return "Other"
                }
            }
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            selectedMainCategory = mainCategories[row]
            mainCategoryDropdown.text = mainCategories[row].name
            self.fetchDataSubCategory(id: mainCategories[row].id)
            subcategoryDropdown.text = nil
            properties = []
            propertyDropdowns.forEach { $0.removeFromSuperview() }
            propertyTextFields.forEach{ $0.removeFromSuperview()}
            propertyDropdowns.removeAll()
            propertyTextFields.removeAll()
            selectedSubcategory = nil
            
            //Update subcategory dropdown
            let subcategoryPicker = subcategoryDropdown.inputView as? UIPickerView
            subcategoryPicker?.reloadAllComponents()

        } else if pickerView.tag == 1 {
            selectedSubcategory = subcategories[row]
            subcategoryDropdown.text = subcategories[row].name
            properties = selectedSubcategory?.options ?? []
            generatePropertyFields(properties: properties)
        } else {
            // Handle property selection
            if let property = properties.first(where: { $0.id == pickerView.tag }) {
                let selectedValue: String
                if row < properties.count {
                    selectedValue = properties[row].name
                    // Remove any "Other" text field if it exists.
                    if let textFieldIndex = propertyTextFields.firstIndex(where: { $0.tag == pickerView.tag }) {
                        let textField = propertyTextFields[textFieldIndex]
                        textField.removeFromSuperview()
                        propertyTextFields.remove(at: textFieldIndex)
                    }
                    
                } else {
                    selectedValue = "Other"
                }
                
                //Update selected value
                selectedValues[property.name] = selectedValue
                
                //Update the property dropdown text.
                if let dropdown = propertyDropdowns.first(where: {$0.tag == pickerView.tag}){
                    dropdown.text = selectedValue
                }
                
                // Handle child properties.
                if let selectedProperty = properties.first(where: {$0.id == pickerView.tag}){
                    let children = selectedProperty.has_child
                    if children == true{
                        
                    //Generate the child properties.
                    generatePropertyFields(properties: properties)
                } else {
                    // Remove any child property dropdowns and text fields
                    let childPropertyIds = getAllChildPropertyIds(from: [property])
                    for childId in childPropertyIds {
                        if let dropdownIndex = propertyDropdowns.firstIndex(where: { $0.tag == childId }) {
                            let dropdown = propertyDropdowns[dropdownIndex]
                            dropdown.removeFromSuperview()
                            propertyDropdowns.remove(at: dropdownIndex)
                        }
                        if let textFieldIndex = propertyTextFields.firstIndex(where: { $0.tag == childId }) {
                            let textField = propertyTextFields[textFieldIndex]
                            textField.removeFromSuperview()
                            propertyTextFields.remove(at: textFieldIndex)
                        }
                    }
                }
            }
                
                //Find the textfield and update selected values.
                if let textField = propertyTextFields.first(where: {$0.tag == pickerView.tag}){
                    selectedValues[property.name] = textField.text
                }
            }
        }
    }
    
    //Helper function to get all child property IDs.
    private func getAllChildPropertyIds(from properties: [Option]) -> [Int] {
        var ids: [Int] = []
        for property in properties {
            ids.append(property.id)
                ids.append(contentsOf: getAllChildPropertyIds(from: [property]))
            
        }
        return ids
    }

    //MARK: tableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedValues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = Array(selectedValues.keys)[indexPath.row]
        let value = selectedValues[key] ?? ""
        cell.textLabel?.text = "\(key): \(value)"
        return cell
    }
}
