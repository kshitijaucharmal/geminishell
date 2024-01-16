# Maintainer: Kshitij Aucharmal <kshitijaucharmal21@gmail.com>
pkgname='geminishell'
pkgver=1
pkgrel=1
pkgdesc="Supercharge your terminal with the power of AI"
arch=('x86_64')
url="https://github.com/kshitijaucharmal/Gemini-Shell"
license=('Apache')
depends=('python>=3.9.0')
makedepends=('git', 'python-setuptools')
source=('$pkgname::git://github.com/kshitijaucharmal/Gemini-Shell')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
