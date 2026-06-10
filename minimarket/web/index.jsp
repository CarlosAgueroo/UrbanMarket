<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Urban Market - Minimarket. Productos frescos y de calidad.">
    <title>Inicio - Urban Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body { background-color: #f5f5f5; font-family: Arial, sans-serif; }
        .navbar { background-color: #1a7a3c !important; }
        .navbar-brand { font-weight: bold; font-size: 1.3rem; }
        .hero-section {
            background-color: #1a7a3c;
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        .hero-section h1 { font-size: 2.2rem; font-weight: bold; margin-bottom: 10px; }
        .hero-section p { font-size: 1rem; opacity: 0.9; margin-bottom: 24px; }
        .btn-hero { background-color: #ff8c00; color: white; border: none; padding: 10px 28px; font-weight: bold; border-radius: 4px; }
        .btn-hero:hover { background-color: #e07800; color: white; }
        .section-title { font-weight: bold; color: #1a7a3c; border-bottom: 3px solid #1a7a3c; display: inline-block; padding-bottom: 4px; margin-bottom: 24px; }
        .product-card { background: white; border: 1px solid #e0e0e0; border-radius: 6px; overflow: hidden; transition: box-shadow 0.2s; height: 100%; }
        .product-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.12); }
        .product-card img { width: 100%; height: 160px; object-fit: cover; }
        .product-card .card-body { padding: 12px; }
        .product-card .card-title { font-size: 0.95rem; font-weight: bold; color: #222; margin-bottom: 6px; }
        .product-card .price { color: #1a7a3c; font-weight: bold; font-size: 1rem; }
        .btn-comprar { background-color: #1a7a3c; color: white; border: none; padding: 7px 0; width: 100%; border-radius: 4px; font-size: 0.9rem; }
        .btn-comprar:hover { background-color: #145f2e; color: white; }
        .info-bar { background-color: #145f2e; color: white; padding: 10px 0; font-size: 0.85rem; }
        .info-bar span { margin: 0 16px; }
        footer { background-color: #222; color: #ccc; padding: 28px 0; margin-top: 40px; }
        footer .brand { color: white; font-weight: bold; font-size: 1.1rem; }
    </style>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.jsp">
                <span class="material-icons">storefront</span>
                Urban Market
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="Nosotros.jsp">Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- INFO BAR -->
    <div class="info-bar text-center">
        <span><span class="material-icons align-middle" style="font-size:16px">local_shipping</span> Atención en local</span>
        <span>|</span>
        <span><span class="material-icons align-middle" style="font-size:16px">schedule</span> Lun - Dom: 7am - 9pm</span>
        <span>|</span>
        <span><span class="material-icons align-middle" style="font-size:16px">phone</span> 999 000 111</span>
    </div>

    <!-- HERO -->
    <section class="hero-section">
        <div class="container">
            <h1>Bienvenido a Urban Market</h1>
            <p>Tu minimarket de confianza. Productos frescos y de primera calidad.</p>
            <a href="login.jsp" class="btn btn-hero">
                <span class="material-icons align-middle" style="font-size:18px">login</span>
                Ingresar al Sistema
            </a>
        </div>
    </section>

    <!-- PRODUCTOS DESTACADOS -->
    
    <!-- PRODUCTOS DESTACADOS -->
    <style>
        .nav-pills .nav-link.active { background-color: #1a7a3c !important; }
        .nav-pills .nav-link { color: #1a7a3c; font-weight: bold; }
        /* Custom scrollbar for webkit */
        .scrolling-wrapper::-webkit-scrollbar { height: 8px; }
        .scrolling-wrapper::-webkit-scrollbar-track { background: #f1f1f1; border-radius:4px; }
        .scrolling-wrapper::-webkit-scrollbar-thumb { background: #1a7a3c; border-radius:4px; }
    </style>
    <main class="container my-5">
        <h2 class="section-title">Productos Disponibles</h2>
        
        <ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
            <li class="nav-item">
                <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#pills-todos" type="button">Todos</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#pills-abarrotes" type="button">Abarrotes</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#pills-bebidas" type="button">Bebidas</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#pills-lacteos" type="button">Lácteos</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#pills-limpieza" type="button">Limpieza</button>
            </li>
        </ul>

        <div class="tab-content" id="pills-tabContent">
            <!-- TODOS -->
            <div class="tab-pane fade show active" id="pills-todos" role="tabpanel">
                <div class="d-flex overflow-auto pb-3 gap-3 scrolling-wrapper" style="white-space: nowrap;">

            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Aceite Vegetal Premium PRIMOR Botella 900ml.webp" alt="Aceite Vegetal Premium PRIM...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Aceite Vegetal Premium PRIM...">Aceite Vegetal Premium PRIM...</div>
                    <div class="price">S/ 8.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Arroz Extra Añejo VALLENORTE Gran Reserva Bolsa 5Kg.webp" alt="Arroz Extra Añejo VALLENORT...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Arroz Extra Añejo VALLENORT...">Arroz Extra Añejo VALLENORT...</div>
                    <div class="price">S/ 22.90</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Arroz Extra COSTEÑO Bolsa 5Kg.webp" alt="Arroz Extra COSTEÑO Bolsa 5Kg">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Arroz Extra COSTEÑO Bolsa 5Kg">Arroz Extra COSTEÑO Bolsa 5Kg</div>
                    <div class="price">S/ 20.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Arveja Verde COSTEÑO Bolsa 500g.webp" alt="Arveja Verde COSTEÑO Bolsa ...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Arveja Verde COSTEÑO Bolsa ...">Arveja Verde COSTEÑO Bolsa ...</div>
                    <div class="price">S/ 3.80</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Azúcar Rubia M&K Bolsa 1Kg.webp" alt="Azúcar Rubia M&K Bolsa 1Kg">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Azúcar Rubia M&K Bolsa 1Kg">Azúcar Rubia M&K Bolsa 1Kg</div>
                    <div class="price">S/ 4.20</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Fideos Tornillo DON VITTORIO Bolsa 500g.webp" alt="Fideos Tornillo DON VITTORI...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Fideos Tornillo DON VITTORI...">Fideos Tornillo DON VITTORI...</div>
                    <div class="price">S/ 3.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Frijol Negro FARAON Bolsa x500g.webp" alt="Frijol Negro FARAON Bolsa x...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Frijol Negro FARAON Bolsa x...">Frijol Negro FARAON Bolsa x...</div>
                    <div class="price">S/ 6.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Lenteja Bebé FARAON Bolsa 500g.webp" alt="Lenteja Bebé FARAON Bolsa 500g">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Lenteja Bebé FARAON Bolsa 500g">Lenteja Bebé FARAON Bolsa 500g</div>
                    <div class="price">S/ 5.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Maíz Pop Corn COSTEÑO Bolsa 500g.webp" alt="Maíz Pop Corn COSTEÑO Bolsa...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Maíz Pop Corn COSTEÑO Bolsa...">Maíz Pop Corn COSTEÑO Bolsa...</div>
                    <div class="price">S/ 4.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/abarrotes/Quinua COSTEÑO Bolsa 500g.webp" alt="Quinua COSTEÑO Bolsa 500g">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Quinua COSTEÑO Bolsa 500g">Quinua COSTEÑO Bolsa 500g</div>
                    <div class="price">S/ 9.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa COCA COLA Paquete 12 Botellas 600ml.webp" alt="Gaseosa COCA COLA Paquete 1...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa COCA COLA Paquete 1...">Gaseosa COCA COLA Paquete 1...</div>
                    <div class="price">S/ 25.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa COCA COLA Paquete 6 Botellas 1.5L.webp" alt="Gaseosa COCA COLA Paquete 6...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa COCA COLA Paquete 6...">Gaseosa COCA COLA Paquete 6...</div>
                    <div class="price">S/ 30.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa COCA COLA Sabor Original Paquete 4 Botellas 3.jpg" alt="Gaseosa COCA COLA Sabor Ori...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa COCA COLA Sabor Ori...">Gaseosa COCA COLA Sabor Ori...</div>
                    <div class="price">S/ 40.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa CONCORDIA Piña Paquete 15 Botellas 355ml.jpg" alt="Gaseosa CONCORDIA Piña Paqu...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa CONCORDIA Piña Paqu...">Gaseosa CONCORDIA Piña Paqu...</div>
                    <div class="price">S/ 18.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa EVERVESS Ginger Ale Paquete 6 Botellas 1.5L.webp" alt="Gaseosa EVERVESS Ginger Ale...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa EVERVESS Ginger Ale...">Gaseosa EVERVESS Ginger Ale...</div>
                    <div class="price">S/ 22.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa FANTA Kola Inglesa Paquete 12 Botellas 500ml.jpg" alt="Gaseosa FANTA Kola Inglesa ...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa FANTA Kola Inglesa ...">Gaseosa FANTA Kola Inglesa ...</div>
                    <div class="price">S/ 24.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa FANTA Naranja Paquete 12 Botellas 500ml.jpg" alt="Gaseosa FANTA Naranja Paque...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa FANTA Naranja Paque...">Gaseosa FANTA Naranja Paque...</div>
                    <div class="price">S/ 24.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa INCA KOLA Paquete 12 Botellas 600ml.webp" alt="Gaseosa INCA KOLA Paquete 1...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa INCA KOLA Paquete 1...">Gaseosa INCA KOLA Paquete 1...</div>
                    <div class="price">S/ 25.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa INCA KOLA Sabor Original Paquetes Botellas 3L.webp" alt="Gaseosa INCA KOLA Sabor Ori...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa INCA KOLA Sabor Ori...">Gaseosa INCA KOLA Sabor Ori...</div>
                    <div class="price">S/ 11.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/bebidas/Gaseosa SPRITE Lima limón Paquete 12 Botellas 500ml.webp" alt="Gaseosa SPRITE Lima limón P...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Gaseosa SPRITE Lima limón P...">Gaseosa SPRITE Lima limón P...</div>
                    <div class="price">S/ 25.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Leche Light GLORIA Lata 390g Paquete 6un.webp" alt="Leche Light GLORIA Lata 390...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Leche Light GLORIA Lata 390...">Leche Light GLORIA Lata 390...</div>
                    <div class="price">S/ 22.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Leche Reconstituida Entera GLORIA Lata 390g Paquete 6un.webp" alt="Leche Reconstituida Entera ...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Leche Reconstituida Entera ...">Leche Reconstituida Entera ...</div>
                    <div class="price">S/ 20.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Leche sin Lactosa LAIVE UHT Caja 946ml Paquete 4un.webp" alt="Leche sin Lactosa LAIVE UHT...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Leche sin Lactosa LAIVE UHT...">Leche sin Lactosa LAIVE UHT...</div>
                    <div class="price">S/ 18.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Mezcla Láctea LAIVE Sin Lactosa Caja 480g Paquete 6un.webp" alt="Mezcla Láctea LAIVE Sin Lac...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Mezcla Láctea LAIVE Sin Lac...">Mezcla Láctea LAIVE Sin Lac...</div>
                    <div class="price">S/ 15.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Mezcla Láctea Light BONLÉ Caja 480g Paquete 6un.webp" alt="Mezcla Láctea Light BONLÉ C...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Mezcla Láctea Light BONLÉ C...">Mezcla Láctea Light BONLÉ C...</div>
                    <div class="price">S/ 14.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Yogurt Batido GLORIA Griego Sabor Natural Bolsa 800g.webp" alt="Yogurt Batido GLORIA Griego...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Yogurt Batido GLORIA Griego...">Yogurt Batido GLORIA Griego...</div>
                    <div class="price">S/ 7.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Yogurt Bebible GLORIA Sabor a Fresa Botella 180g.webp" alt="Yogurt Bebible GLORIA Sabor...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Yogurt Bebible GLORIA Sabor...">Yogurt Bebible GLORIA Sabor...</div>
                    <div class="price">S/ 2.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Yogurt GLORIA Battimix Vainilla con Arroz Crujiente Bañado en Chocolate Vaso 146g.webp" alt="Yogurt GLORIA Battimix Vain...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Yogurt GLORIA Battimix Vain...">Yogurt GLORIA Battimix Vain...</div>
                    <div class="price">S/ 3.20</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Yogurt Griego VAKIMU Original Pote 960g.webp" alt="Yogurt Griego VAKIMU Origin...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Yogurt Griego VAKIMU Origin...">Yogurt Griego VAKIMU Origin...</div>
                    <div class="price">S/ 18.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/lacteos/Yogurt Parcialmente Descremado GLORIA Fresa Galonera 1.6Kg.webp" alt="Yogurt Parcialmente Descrem...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Yogurt Parcialmente Descrem...">Yogurt Parcialmente Descrem...</div>
                    <div class="price">S/ 16.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente en Polvo BOLIVAR Cuidado Total Bolsa 2.4kg.webp" alt="Detergente en Polvo BOLIVAR...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente en Polvo BOLIVAR...">Detergente en Polvo BOLIVAR...</div>
                    <div class="price">S/ 24.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente en Polvo OPAL Ultra Bolsa 2.4kg.webp" alt="Detergente en Polvo OPAL Ul...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente en Polvo OPAL Ul...">Detergente en Polvo OPAL Ul...</div>
                    <div class="price">S/ 20.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente en Polvo OPAL Ultra Bolsa 9Kg.webp" alt="Detergente en Polvo OPAL Ul...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente en Polvo OPAL Ul...">Detergente en Polvo OPAL Ul...</div>
                    <div class="price">S/ 65.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente en Polvo Profesional MARSELLA Bolsa 13.5Kg.webp" alt="Detergente en Polvo Profesi...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente en Polvo Profesi...">Detergente en Polvo Profesi...</div>
                    <div class="price">S/ 85.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente en Polvo SAPOLIO Floral Bolsa 2Kg.webp" alt="Detergente en Polvo SAPOLIO...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente en Polvo SAPOLIO...">Detergente en Polvo SAPOLIO...</div>
                    <div class="price">S/ 14.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente MARSELLA Lavanda y Rosas Bolsa 2kg.webp" alt="Detergente MARSELLA Lavanda...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente MARSELLA Lavanda...">Detergente MARSELLA Lavanda...</div>
                    <div class="price">S/ 16.90</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Detergente SKIP Líquido Bio Enzimas Doypack 3L.webp" alt="Detergente SKIP Líquido Bio...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Detergente SKIP Líquido Bio...">Detergente SKIP Líquido Bio...</div>
                    <div class="price">S/ 35.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Jabón BOLIVAR Cuidado Bebés Bolsa 380g.webp" alt="Jabón BOLIVAR Cuidado Bebés...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Jabón BOLIVAR Cuidado Bebés...">Jabón BOLIVAR Cuidado Bebés...</div>
                    <div class="price">S/ 6.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Jabón de Lavar BOLÍVAR Cuidado Total Limón Bolsa 380g.webp" alt="Jabón de Lavar BOLÍVAR Cuid...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Jabón de Lavar BOLÍVAR Cuid...">Jabón de Lavar BOLÍVAR Cuid...</div>
                    <div class="price">S/ 5.50</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
            <div class="product-card" style="min-width: 200px; max-width: 200px; flex: 0 0 auto; white-space: normal;">
                <img src="img/minimarket/limpieza/Quitamanchas Líquido ARO Ropa Color Galonera 5L.webp" alt="Quitamanchas Líquido ARO Ro...">
                <div class="card-body">
                    <div class="card-title text-truncate" title="Quitamanchas Líquido ARO Ro...">Quitamanchas Líquido ARO Ro...</div>
                    <div class="price">S/ 22.00</div>
                    <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                </div>
            </div>
                </div>
            </div>

            <!-- ABARROTES -->
            <div class="tab-pane fade" id="pills-abarrotes" role="tabpanel">
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">

            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Aceite Vegetal Premium PRIMOR Botella 900ml.webp" alt="Aceite Vegetal Premium PRIM...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Aceite Vegetal Premium PRIM...">Aceite Vegetal Premium PRIM...</div>
                        <div class="price">S/ 8.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Arroz Extra Añejo VALLENORTE Gran Reserva Bolsa 5Kg.webp" alt="Arroz Extra Añejo VALLENORT...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Arroz Extra Añejo VALLENORT...">Arroz Extra Añejo VALLENORT...</div>
                        <div class="price">S/ 22.90</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Arroz Extra COSTEÑO Bolsa 5Kg.webp" alt="Arroz Extra COSTEÑO Bolsa 5Kg">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Arroz Extra COSTEÑO Bolsa 5Kg">Arroz Extra COSTEÑO Bolsa 5Kg</div>
                        <div class="price">S/ 20.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Arveja Verde COSTEÑO Bolsa 500g.webp" alt="Arveja Verde COSTEÑO Bolsa ...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Arveja Verde COSTEÑO Bolsa ...">Arveja Verde COSTEÑO Bolsa ...</div>
                        <div class="price">S/ 3.80</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Azúcar Rubia M&K Bolsa 1Kg.webp" alt="Azúcar Rubia M&K Bolsa 1Kg">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Azúcar Rubia M&K Bolsa 1Kg">Azúcar Rubia M&K Bolsa 1Kg</div>
                        <div class="price">S/ 4.20</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Fideos Tornillo DON VITTORIO Bolsa 500g.webp" alt="Fideos Tornillo DON VITTORI...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Fideos Tornillo DON VITTORI...">Fideos Tornillo DON VITTORI...</div>
                        <div class="price">S/ 3.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Frijol Negro FARAON Bolsa x500g.webp" alt="Frijol Negro FARAON Bolsa x...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Frijol Negro FARAON Bolsa x...">Frijol Negro FARAON Bolsa x...</div>
                        <div class="price">S/ 6.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Lenteja Bebé FARAON Bolsa 500g.webp" alt="Lenteja Bebé FARAON Bolsa 500g">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Lenteja Bebé FARAON Bolsa 500g">Lenteja Bebé FARAON Bolsa 500g</div>
                        <div class="price">S/ 5.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Maíz Pop Corn COSTEÑO Bolsa 500g.webp" alt="Maíz Pop Corn COSTEÑO Bolsa...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Maíz Pop Corn COSTEÑO Bolsa...">Maíz Pop Corn COSTEÑO Bolsa...</div>
                        <div class="price">S/ 4.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/abarrotes/Quinua COSTEÑO Bolsa 500g.webp" alt="Quinua COSTEÑO Bolsa 500g">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Quinua COSTEÑO Bolsa 500g">Quinua COSTEÑO Bolsa 500g</div>
                        <div class="price">S/ 9.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
                </div>
            </div>

            <!-- BEBIDAS -->
            <div class="tab-pane fade" id="pills-bebidas" role="tabpanel">
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">

            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa COCA COLA Paquete 12 Botellas 600ml.webp" alt="Gaseosa COCA COLA Paquete 1...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa COCA COLA Paquete 1...">Gaseosa COCA COLA Paquete 1...</div>
                        <div class="price">S/ 25.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa COCA COLA Paquete 6 Botellas 1.5L.webp" alt="Gaseosa COCA COLA Paquete 6...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa COCA COLA Paquete 6...">Gaseosa COCA COLA Paquete 6...</div>
                        <div class="price">S/ 30.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa COCA COLA Sabor Original Paquete 4 Botellas 3.jpg" alt="Gaseosa COCA COLA Sabor Ori...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa COCA COLA Sabor Ori...">Gaseosa COCA COLA Sabor Ori...</div>
                        <div class="price">S/ 40.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa CONCORDIA Piña Paquete 15 Botellas 355ml.jpg" alt="Gaseosa CONCORDIA Piña Paqu...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa CONCORDIA Piña Paqu...">Gaseosa CONCORDIA Piña Paqu...</div>
                        <div class="price">S/ 18.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa EVERVESS Ginger Ale Paquete 6 Botellas 1.5L.webp" alt="Gaseosa EVERVESS Ginger Ale...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa EVERVESS Ginger Ale...">Gaseosa EVERVESS Ginger Ale...</div>
                        <div class="price">S/ 22.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa FANTA Kola Inglesa Paquete 12 Botellas 500ml.jpg" alt="Gaseosa FANTA Kola Inglesa ...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa FANTA Kola Inglesa ...">Gaseosa FANTA Kola Inglesa ...</div>
                        <div class="price">S/ 24.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa FANTA Naranja Paquete 12 Botellas 500ml.jpg" alt="Gaseosa FANTA Naranja Paque...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa FANTA Naranja Paque...">Gaseosa FANTA Naranja Paque...</div>
                        <div class="price">S/ 24.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa INCA KOLA Paquete 12 Botellas 600ml.webp" alt="Gaseosa INCA KOLA Paquete 1...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa INCA KOLA Paquete 1...">Gaseosa INCA KOLA Paquete 1...</div>
                        <div class="price">S/ 25.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa INCA KOLA Sabor Original Paquetes Botellas 3L.webp" alt="Gaseosa INCA KOLA Sabor Ori...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa INCA KOLA Sabor Ori...">Gaseosa INCA KOLA Sabor Ori...</div>
                        <div class="price">S/ 11.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/bebidas/Gaseosa SPRITE Lima limón Paquete 12 Botellas 500ml.webp" alt="Gaseosa SPRITE Lima limón P...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Gaseosa SPRITE Lima limón P...">Gaseosa SPRITE Lima limón P...</div>
                        <div class="price">S/ 25.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
                </div>
            </div>

            <!-- LACTEOS -->
            <div class="tab-pane fade" id="pills-lacteos" role="tabpanel">
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">

            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Leche Light GLORIA Lata 390g Paquete 6un.webp" alt="Leche Light GLORIA Lata 390...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Leche Light GLORIA Lata 390...">Leche Light GLORIA Lata 390...</div>
                        <div class="price">S/ 22.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Leche Reconstituida Entera GLORIA Lata 390g Paquete 6un.webp" alt="Leche Reconstituida Entera ...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Leche Reconstituida Entera ...">Leche Reconstituida Entera ...</div>
                        <div class="price">S/ 20.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Leche sin Lactosa LAIVE UHT Caja 946ml Paquete 4un.webp" alt="Leche sin Lactosa LAIVE UHT...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Leche sin Lactosa LAIVE UHT...">Leche sin Lactosa LAIVE UHT...</div>
                        <div class="price">S/ 18.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Mezcla Láctea LAIVE Sin Lactosa Caja 480g Paquete 6un.webp" alt="Mezcla Láctea LAIVE Sin Lac...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Mezcla Láctea LAIVE Sin Lac...">Mezcla Láctea LAIVE Sin Lac...</div>
                        <div class="price">S/ 15.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Mezcla Láctea Light BONLÉ Caja 480g Paquete 6un.webp" alt="Mezcla Láctea Light BONLÉ C...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Mezcla Láctea Light BONLÉ C...">Mezcla Láctea Light BONLÉ C...</div>
                        <div class="price">S/ 14.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Yogurt Batido GLORIA Griego Sabor Natural Bolsa 800g.webp" alt="Yogurt Batido GLORIA Griego...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Yogurt Batido GLORIA Griego...">Yogurt Batido GLORIA Griego...</div>
                        <div class="price">S/ 7.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Yogurt Bebible GLORIA Sabor a Fresa Botella 180g.webp" alt="Yogurt Bebible GLORIA Sabor...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Yogurt Bebible GLORIA Sabor...">Yogurt Bebible GLORIA Sabor...</div>
                        <div class="price">S/ 2.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Yogurt GLORIA Battimix Vainilla con Arroz Crujiente Bañado en Chocolate Vaso 146g.webp" alt="Yogurt GLORIA Battimix Vain...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Yogurt GLORIA Battimix Vain...">Yogurt GLORIA Battimix Vain...</div>
                        <div class="price">S/ 3.20</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Yogurt Griego VAKIMU Original Pote 960g.webp" alt="Yogurt Griego VAKIMU Origin...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Yogurt Griego VAKIMU Origin...">Yogurt Griego VAKIMU Origin...</div>
                        <div class="price">S/ 18.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/lacteos/Yogurt Parcialmente Descremado GLORIA Fresa Galonera 1.6Kg.webp" alt="Yogurt Parcialmente Descrem...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Yogurt Parcialmente Descrem...">Yogurt Parcialmente Descrem...</div>
                        <div class="price">S/ 16.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
                </div>
            </div>

            <!-- LIMPIEZA -->
            <div class="tab-pane fade" id="pills-limpieza" role="tabpanel">
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">

            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente en Polvo BOLIVAR Cuidado Total Bolsa 2.4kg.webp" alt="Detergente en Polvo BOLIVAR...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente en Polvo BOLIVAR...">Detergente en Polvo BOLIVAR...</div>
                        <div class="price">S/ 24.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente en Polvo OPAL Ultra Bolsa 2.4kg.webp" alt="Detergente en Polvo OPAL Ul...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente en Polvo OPAL Ul...">Detergente en Polvo OPAL Ul...</div>
                        <div class="price">S/ 20.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente en Polvo OPAL Ultra Bolsa 9Kg.webp" alt="Detergente en Polvo OPAL Ul...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente en Polvo OPAL Ul...">Detergente en Polvo OPAL Ul...</div>
                        <div class="price">S/ 65.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente en Polvo Profesional MARSELLA Bolsa 13.5Kg.webp" alt="Detergente en Polvo Profesi...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente en Polvo Profesi...">Detergente en Polvo Profesi...</div>
                        <div class="price">S/ 85.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente en Polvo SAPOLIO Floral Bolsa 2Kg.webp" alt="Detergente en Polvo SAPOLIO...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente en Polvo SAPOLIO...">Detergente en Polvo SAPOLIO...</div>
                        <div class="price">S/ 14.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente MARSELLA Lavanda y Rosas Bolsa 2kg.webp" alt="Detergente MARSELLA Lavanda...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente MARSELLA Lavanda...">Detergente MARSELLA Lavanda...</div>
                        <div class="price">S/ 16.90</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Detergente SKIP Líquido Bio Enzimas Doypack 3L.webp" alt="Detergente SKIP Líquido Bio...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Detergente SKIP Líquido Bio...">Detergente SKIP Líquido Bio...</div>
                        <div class="price">S/ 35.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Jabón BOLIVAR Cuidado Bebés Bolsa 380g.webp" alt="Jabón BOLIVAR Cuidado Bebés...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Jabón BOLIVAR Cuidado Bebés...">Jabón BOLIVAR Cuidado Bebés...</div>
                        <div class="price">S/ 6.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Jabón de Lavar BOLÍVAR Cuidado Total Limón Bolsa 380g.webp" alt="Jabón de Lavar BOLÍVAR Cuid...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Jabón de Lavar BOLÍVAR Cuid...">Jabón de Lavar BOLÍVAR Cuid...</div>
                        <div class="price">S/ 5.50</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
            <div class="col mt-3">
                <div class="product-card">
                    <img src="img/minimarket/limpieza/Quitamanchas Líquido ARO Ropa Color Galonera 5L.webp" alt="Quitamanchas Líquido ARO Ro...">
                    <div class="card-body">
                        <div class="card-title text-truncate" title="Quitamanchas Líquido ARO Ro...">Quitamanchas Líquido ARO Ro...</div>
                        <div class="price">S/ 22.00</div>
                        <a href="login.jsp" class="btn btn-comprar mt-2">Agregar</a>
                    </div>
                </div>
            </div>
                </div>
            </div>

        </div>
    </main>
    
<!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="footer-brand mb-2">
                    <span class="material-icons align-middle">storefront</span>
                    Urban Market
                </div>
                <small>Tel: 999 000 111<br>info@urbanmarket.pe</small>
                </div>
                <div class="col-md-4 mt-3 mt-md-0">
                    <strong style="color:white">Horario de Atención</strong><br>
                    <small>Lunes a Domingo: 7:00am - 9:00pm</small>
                </div>
                <div class="col-md-4 mt-3 mt-md-0">
                    <strong style="color:white">Contacto</strong><br>
                    <small>Tel: 999 000 111<br>info@urbanmarket.pe</small>
                </div>
            </div>
            <hr style="border-color:#444;margin-top:20px">
            <p class="text-center mb-0 small">&copy; 2026 Urban Market. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
