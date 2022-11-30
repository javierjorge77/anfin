import ScrollReveal from 'stimulus-scroll-reveal'
/// Sample code in case you want to modify the behavior of the animation

export default class extends ScrollReveal {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }

  // Override this method to change the IntersectionObserver behavior
  intersectionObserverCallback(entries, observer) {
    //
  }

  // Options used for the IntersectionObserver
  get intersectionObserverOptions() {
    return {}
  }

  // You can override this getter to set your default options here.
  get defaultOptions() {
    return {
      class: 'active',
      threshold: 0.5,
      rootMargin: '100px',
    }
  }
}
