import Tab from './Tab';
import './Tabs.css';

function Tabs(props) {
  const { elements } = props;
  return (
    <section>
      {elements.map(e => {
        return <Tab 
          title={e.title}
          subtitle={e.subtitle}
          bkg_img={e.bkg_img}
        />})}
    </section>
  );
}

export default Tabs;