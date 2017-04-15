import React from 'react';
import './Header.css'

const Header = () => {
    const title = 'Enterprise Art Store'
    const subtitle = 'Motivation by Synergy'
    return (
        <div className='headerSection'>
            <div className='headerTitle'>
                {title}
            </div>
            <div className='headerSubtitle'>
                {subtitle}
            </div>
        </div>
    );
}

export default Header;
