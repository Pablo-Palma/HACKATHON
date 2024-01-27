# Quiénes somos
Somos un grupo de desarrolladores de software y UI/UX que nos conocimos en una hackathon de blockchain organizada por Rootstock, Vottun y Dextools en 42 Madrid.

En un fin de semana tuvimos que desarrollar un producto mínimo viable de nuestra idea de servicio. Desde entonces nos hemos dedicado a diseñar y desarrollar para blockchain compatibles con EVM.

# Nuestra visión
Creemos en un mundo descentralizado donde la información de la blockchain puede ayudarnos a tomar mejores decisiones en nuestras relaciones económicas onchain y offchain. Todo ello gracias a la persistencia de la información y trazabilidad. Así como a la posibilidad de que los servicios que creamos pueden seguir funcionando en el futuro.

# El servicio de onchain feedback
Con nuestro servicio tratamos de resolver el problema de la reputación y reseñas online.

El principal problema son las reseñas falsas, por un lado, y por otro que la web donde las publicas borre las que le perjudican. Publicándolas en un blockchain conseguimos transparencia y trazabilidad, lo que garantiza que no se puedan borrar.

Tradicionalmente, la reputación no pertenece a la persona interesada, sino a la entidad que gestiona la web donde se publica. Lo que supone la fragmentación de la reputación (la reputación en eBay es totalmente independiente de la que podamos tener en Airbnb) que implica que su utilidad práctica se ve disminuida.

Con nuestro servicio, además, se puede no solo publicar feedback de transacciones con otras personas, sino también con contratos inteligentes. El caso típico es reportar honeypots, wallets drainers o webs que han sido hackeadas y se le ha cambiado el contrato legítimo por uno de los hackers. En estas situaciones, antes de interactuar con un contrato, el usuario puede comprobar los comentarios anteriores. Y lo más, importante, la comprobación puede ser bien manual, bien automática por el wallet del usuario.

Un ejemplo concreto podría ser una web3. Su equipo de desarrollo pueden publicar un auto-feedback -en principio positivo-, depositarse a ellos mismo un "tip" -como colateral- y someterse a una DAO de arbitraje. En la práctica funciona como garantía de que su contrato no tiene bugs, y también de que van a actuar de buena fe, pues, en caso contrario la DAO de arbitraje destinaria su auto-tip a los eventuales usuarios afectados.

Por otro lado, en la que un actor malicioso sustituye el contrato con el que el usuario interactúa con la finalidad de apoderarse de sus fondos. Si el usuario comprueba la reputación del nuevo contrato verá diversas banderas rojas: que tiene recientes comentarios negativos, que los comentarios son solo nuevos, o que no tiene "colateral" del equipo de desarrollo.

# Modelo de negocio
El modelo de negocio consiste en cobrar un porcentaje de comisión de los "tips" y garantías que se dejen.

Existen otras posibles vías de negocio:
- La prestación de servicios complementarios como pueden ser hacer "escrow" o actuar como DAO de arbitraje.
- Que el contrato inteligente funcione como oráculo de reputación cobrar una comisión por cada consulta que le hagan otros contratos inteligentes. Por ejemplo: un contrato inteligencia que quiera dar un prestamo "under collateralized" siempre que el usuario tenga buena reputación.
- Publicidad en la web.
- Análisis de opiniones por IA.
