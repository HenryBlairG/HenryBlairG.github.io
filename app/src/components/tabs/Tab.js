function Tab (props) {
  const { title, subtitle, bkg_img } = props;
  return (
    <section>
      <h1>{title}</h1>
      <p>{subtitle}</p>
      <img alt={title} href={bkg_img}/>
    </section>
  );
}

export default Tab;