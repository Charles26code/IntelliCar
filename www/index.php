<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>IntelliCar</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/car.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/motor.css" rel="stylesheet" />
        <script src="js/carousel.js"></script>
        <script src="js/indicator.js"></script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">IntelliCar</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#Modeles">Modeles</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#reservation">Reservation</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Vitrine Image-->
                <img class="masthead-vitrine mb-5" src="assets/img/vitrine.svg"/>
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Le concessionnaire qu'il vous faut</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Ventes - Locations</p>
            </div>
        </header>
        <!-- Modeles Section-->
        <section class="page-section Modeles" id="Modeles">
            <div class="container">
                <!-- Modeles Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Modeles</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>

                <div class="container my-4">
                    <!--Carousel Wrapper-->
                    <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
                        <!--Controls-->
                        <div class="controls-top" style="text-align:center">
                            <a class="btn-floating" onclick="slide('left')" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
                            <a class="btn-floating" onclick="slide('right')" data-slide="next"><i class="fa fa-chevron-right"></i></a>
                        </div>
                        <!--/.Controls-->
                        <!--Indicators-->
                        <ol class="carousel-indicators">
                            <li id="boule-1" class="caca cacaEnAvant" data-target="#multi-item-example" data-slide-to="0" class="active"></li>
                            <li id="boule-2" class="caca" data-target="#multi-item-example" data-slide-to="1"></li>
                            <li id="boule-3" class="caca" data-target="#multi-item-example" data-slide-to="2"></li>
                        </ol>
                        <!--/.Indicators-->
                    
                        <!--Slides-->
                        <div class="carousel-inner" role="listbox">

                        <!--First slide-->
                        <div id="slide-1" class="carousel-item active">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card mb-2">
                                    <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car1.png"
                                        alt="Card image cap">
                                        <div class="card-body">
                                        <h4 class="card-title">Audi e-Tron GT</h4>
                                        <p class="card-text">Un modèle fascinant aux finitions exceptionnelles. L'électrique de demain est déjà présent dans ce bijou de technologie</p><br>
                                        <a class="btn btn-primary">Réserver</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car2.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Volkswagen Golf 7</h4>
                                    <p class="card-text">Une puissance à vous donner la chair de poule. La Golf 7 de Volkswagen est une voiture complète qui vous fera aimer la conduite sportive</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                    
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car3.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Ford Mustang</h4>
                                    <p class="card-text">Le modèle inconique de Ford Mustang délivre du pur plaisir à chaque trajet et se distinguent par leur design aérodynamique et leur style agressif</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                            </div>
                    
                        </div>
                        <!--/.First slide-->
                    
                        <!--Second slide-->
                        <div id="slide-2" class="carousel-item">
                    
                            <div class="row">
                            <div class="col-md-4">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car4.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">BMW M4</h4>
                                    <p class="card-text">Les BMW Série 4 Coupé M offrent une combinaison fascinante d'esthétique, de caractère et de sportivité typique de la ligne M</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                    
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car5.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Mercedes-AMG GT</h4>
                                    <p class="card-text">Le Mercedes-AMG GT est un spectaculaire modèle Grand Tourisme animé par un moteur V8 biturbo AMG de 4,0 litres</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                    
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car6.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Tesla Model S</h4>
                                    <p class="card-text">La Tesla Model S est conçue pour la vitesse et l'autonomie, avec une accélération démesurée, des performances époustouflantes et un design élégant.</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                            </div>
                    
                        </div>
                        <!--/.Second slide-->
                    
                        <!--Third slide-->
                        <div id="slide-3" class="carousel-item">
                            <div class="row">
                            <div class="col-md-4">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car7.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Peugeot 208</h4>
                                    <p class="card-text">Découvrez la Peugeot 208 : la citadine au design sportif. Parfaite pour vos déplacements citadins, cette voiture est d'une beauté inégalée</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                    
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car8.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Clio III</h4>
                                    <p class="card-text">La Clio 3 est parfaite pour vos déplacements en ville. Cette dernière vous offrera confort et vitesse malgré le compteur bloqué à 170km/h</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                    
                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card mb-2">
                                <img id="forced-card-img-top" class="card-img-top" src="assets/img/Modeles/car9.png"
                                    alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Lamborghini Aventador</h4>
                                    <p class="card-text">L’Aventador a été conçue pour aller au-delà du concept de performance, faisant d’emblée figure de référence dans le domaine des supersportives</p><br>
                                    <a class="btn btn-primary">Réserver</a>
                                </div>
                                </div>
                            </div>
                            </div>
                            
                        </div>
                        <!--/.Third slide-->
                    
                        </div>
                        <!--/.Slides-->
                    </div>
                    <!--/.Carousel Wrapper-->
                </div>
            </div>
        </section>
        <!-- Reservation Section-->
        <section class="page-section" id="reservation">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Reservez ici!</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Reservation Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Marque input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Peugeot" data-sb-validations="required" />
                                <label for="name">Marque du véhicule</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">Marque requise.</div>
                            </div>
                            <!-- Modele input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="208" data-sb-validations="required" />
                                <label for="email">Modele</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">Modele requis.</div><br>
                            </div>
                            <!-- Options input-->
                            <h1 style="font-family:var(--bs-body-font-family);">Options du véhicule</h1>
                            <form action="/action_page.php">
                                <input type="checkbox" id="option1" name="option1"  value="Siege">
                                <label for="option1" style="font-family:var(--bs-body-font-family);"> Siège chauffant</label><br><br>
                                <input type="checkbox" id="option2" name="option2" value="Startnstop">
                                <label for="option2" style="font-family:var(--bs-body-font-family);"> Start and Stop</label><br><br>
                                <input type="checkbox" id="option3" name="option3" value="eclauto">
                                <label for="option3" style="font-family:var(--bs-body-font-family);"> Eclairage automatique</label><br><br>
                                <input type="checkbox" id="option4" name="option4" value="toitouvrant">
                                <label for="option4" style="font-family:var(--bs-body-font-family);"> Toit ouvrant</label><br><br>
                                <input type="checkbox" id="option5" name="option5" value="xenon">
                                <label for="option5" style="font-family:var(--bs-body-font-family);"> Phare Xenon</label><br><br>
                            </form>

                            <!-- Price input-->
                            <hr class="mt-5">
                            <h1 style="font-family:var(--bs-body-font-family);">Echelle de prix :</h1>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pricemin" type="pricemin" placeholder="2000€" data-sb-validations="required" />
                                <label for="phone">Prix minimum</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">Prix minimal requis.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="princemax" type="princemax" required placeholder="55000€" data-sb-validations="required" />
                                <label for="phone">Prix maximum</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">Prix maximal requis.</div>
                            </div>
                            <!-- Motor input-->
                            <h1 style="font-family:var(--bs-body-font-family);">Motorisation :</h1>
                            <div>
                                <input type="radio" id="elec" name="motor">
                                <label for="elec">Electrique ⚡️</label><br>
                            </div>
                            <div>
                                <input type="radio" id="therm" name="motor">
                                <label for="therm">Thermique 💭</label><br>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="reserveSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Merci pour de votre demande !</div>
                                    <p>&#128516;</p>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="reserveErrorMessage"><div class="text-center text-danger mb-3">Erreur lors de l'envoi des données!</div></div><br>
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" id="reserveButton" type="submit">Envoyer ma demande de réservation</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-white">A propos</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- About Section Content-->
                <div class="row">
                    <div class="col-lg-4 ms-auto"><p class="lead">Depuis 2007, l'équipe d'IntelliCar se donne pour mission d'accompagner tous les automobilistes en France dans la recherche de la voiture neuve ou d'occasion qui correspond à ce qu'ils sont et à leur façon de vivre avec leur voiture.</p></div>
                    <div class="col-lg-4 me-auto"><p class="lead">Chacun a sa définition de la voiture idéale. La marque, le prix, les équipements… Et tant d'autres paramètres qui demandent un peu d'expertise pour ne pas se tromper. Sans parler des risques qui se cachent parfois dans un tel achat.</p></div>
                </div>
                <!-- About Section Button-->
                <div class="text-center mt-4">
                    <a class="btn btn-xl btn-outline-light" href="https://tesla.com">
                        <i class="fas fa-download me-2"></i>
                        Notre carte!
                    </a>
                </div>
            </div>
        </section>
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contactez-nous!</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN" action="index.php#contact">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Entrez votre nom..." data-sb-validations="required" />
                                <label for="name">Nom complet</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">Nom requis.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="nom@exemple.com" data-sb-validations="required,email" />
                                <label for="email">Email</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">Email requis.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email non valide.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">Numéro de téléphone</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">Numéro de téléphone requis.</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">Message requis.</div>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Contact établi!</div>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Erreur lors de l'evnoi du message!</div></div>
                            <!-- Submit Button-->
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">Envoyer</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Adresse</h4>
                        <p class="lead mb-0">
                            1 Rue de la Margueritte
                            <br />
                            83130 La Garde
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Nos réseaux</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">A propos de la location</h4>
                        <p class="lead mb-0">
                            Vous pouvez visualiser nos contrats de locations 
                            <a href="https://www.juristique.org/commercial/modele-contrat-location-vehicule">ici.</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright &copy; Notre projet BDD</small></div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
