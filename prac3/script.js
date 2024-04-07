const xmlFile = "employee.xml"; // Replace with your XML file path

function displayEmployees() {
  const xhr = new XMLHttpRequest();
  xhr.open("GET", xmlFile);
  xhr.onload = function () {
    if (xhr.status === 200) {
      const xmlData = xhr.responseXML;
      const employees = parseEmployees(xmlData);
      const container = document.getElementById("employees");
      container.innerHTML = ""; // Clear existing content

      for (const employee of employees) {
        const card = createEmployeeCard(employee);
        container.appendChild(card);
      }
    } else {
      console.error("Error fetching XML file!");
    }
  };
  xhr.send();
}

function parseEmployees(xmlData) {
  const employees = [];
  const root = xmlData.documentElement;

  for (const child of root.children) {
    if (child.nodeName === "Employee") {
      const firstName = child.getElementsByTagName("FirstName")[0].textContent;
      const lastName = child.getElementsByTagName("LastName")[0].textContent;
      const email = child.getElementsByTagName("Email")[0].textContent;
      employees.push({ firstName, lastName, email });
    }
  }
  return employees;
}

function createEmployeeCard(employee) {
  const card = document.createElement("div");
  card.classList.add("Employee");

  const name = document.createElement("p");
  name.textContent = `<b>Name:</b> ${employee.firstName} ${employee.lastName}`;
  card.appendChild(name);

  const email = document.createElement("p");
  email.textContent = `<b>Email:</b> ${employee.email}`;
  card.appendChild(email);

  return card;
}

window.onload = displayEmployees;
