import Foundation

struct Sticker {
    let nombre: String
    let precio: Double
}

var carrito: [Sticker] = []

func mostrarMenu() {
    print("1. Agregar sticker al carrito")
    print("2. Ver carrito")
    print("3. Finalizar compra")
    print("0. Salir")
}

func agregarSticker() {
    print("Ingrese el nombre del sticker:")
    let nombre = readLine() ?? ""
    print("Ingrese el precio del sticker:")
    let precioString = readLine() ?? ""
    guard let precio = Double(precioString) else {
        print("Precio inválido.")
        return
    }
    let sticker = Sticker(nombre: nombre, precio: precio)
    carrito.append(sticker)
    print("Sticker agregado al carrito.")
}

func verCarrito() {
    if carrito.isEmpty {
        print("El carrito está vacío.")
    } else {
        print("Contenido del carrito:")
        for sticker in carrito {
            print("- \(sticker.nombre) - $\(sticker.precio)")
        }
        let total = carrito.reduce(0) { $0 + $1.precio }
        print("Total: $\(total)")
    }
}

func finalizarCompra() {
    print("¡Gracias por tu compra!")
    carrito.removeAll()
}

func main() {
    while true {
        mostrarMenu()
        print("Ingrese una opción:")
        guard let opcionString = readLine(), let opcion = Int(opcionString) else {
            print("Opción inválida.")
            continue
        }
        switch opcion {
        case 1:
            agregarSticker()
        case 2:
            verCarrito()
        case 3:
            finalizarCompra()
        case 0:
            print("¡Hasta luego!")
            return
        default:
            print("Opción inválida.")
        }
    }
}

main()