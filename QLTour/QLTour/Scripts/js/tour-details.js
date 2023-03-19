const toursData = [
    {
        "id": 1,
        "name": "Tour 1",
        "cost": "$100",
        "left": 10,
        "description": "Description of Tour 1",
        "duration": "5 days",
        "start_date": "2023-03-20",
        "location": "Location 1",
        "destination": "Destination 1",
        "img": "https://media.travel.com.vn/LastMinute/lm_230307054814_831950.jpg"
    },
    {
        "id": 2,
        "name": "Tour 2",
        "cost": "$150",
        "left": 5,
        "description": "Description of Tour 2",
        "duration": "7 days",
        "start_date": "2023-04-01",
        "location": "Location 2",
        "destination": "Destination 2",
        "img": "https://media.travel.com.vn/LastMinute/lm_230307054814_831950.jpg"
    },
    {
        "id": 3,
        "name": "Tour 3",
        "cost": "$200",
        "left": 8,
        "description": "Description of Tour 3",
        "duration": "10 days",
        "start_date": "2023-05-15",
        "location": "Location 3",
        "destination": "Destination 3",
        "img": "https://media.travel.com.vn/LastMinute/lm_230307054814_831950.jpg"
    }
];

function displayTourDetails(tour) {
    document.getElementById("tour-id").textContent = tour.id;
    document.getElementById("tour-name").textContent = tour.name;
    document.getElementById("tour-img").src = tour.img;
    document.getElementById("tour-description").textContent = tour.description;
    document.getElementById("tour-duration").textContent = tour.duration;
    document.getElementById("tour-start-date").textContent = tour.start_date;
    document.getElementById("tour-location").textContent = tour.location;
    document.getElementById("tour-destination").textContent = tour.destination;
    document.getElementById("tour-cost").textContent = tour.cost;
    document.getElementById("tour-left").textContent = tour.left;
}

function bookTour(event) {
    event.preventDefault();
    const email = document.getElementById("email").value;
    const contactNo = document.getElementById("contact-no").value;
    const noOfTickets = document.getElementById("no-of-tickets").value;
    alert(`Tour booked for email: ${email}, contact no.: ${contactNo}, no. of tickets: ${noOfTickets}`);
}

function init() {
    displayTourDetails(toursData[1]);
}

window.onload = init(console.log(toursData));