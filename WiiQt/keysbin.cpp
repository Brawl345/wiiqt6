#include "keysbin.h"

KeysBin::KeysBin( QByteArray stuff )
{
    data = stuff;
    if( data.size() && data.size() != 0x400 )
    {
        qWarning() << "KeysBin::KeysBin -> bad size" << Qt::hex << data.size();
    }
}

const QByteArray KeysBin::NG_key_ID()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x208, 4 );
}

const QByteArray KeysBin::NG_ID()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x124, 4 );
}

const QByteArray KeysBin::NG_Sig()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x20c, 0x3c );
}

const QByteArray KeysBin::NG_Priv()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x128, 0x1e );
}

const QByteArray KeysBin::NandKey()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x158, 0x10 );
}

const QByteArray KeysBin::HMac()
{
    if( data.size() != 0x400 )
        return QByteArray();
    return data.mid( 0x144, 0x14 );
}

const QByteArray KeysBin::Boot1Hash()
{
	if( data.size() != 0x400 )
		return QByteArray();
	return data.mid( 0x100, 0x14 );
}

const QByteArray KeysBin::CommonKey()
{
	if( data.size() != 0x400 )
		return QByteArray();
	return data.mid( 0x114, 0x10 );
}

const QByteArray KeysBin::RngKey()
{
	if( data.size() != 0x400 )
		return QByteArray();
	return data.mid( 0x168, 0x10 );
}

const QByteArray KeysBin::Otp()
{
	if( data.size() != 0x400 )
		return QByteArray();
	return data.mid( 0x100, 0x80 );
}

const QByteArray KeysBin::Seeprom()
{
	if( data.size() != 0x400 )
		return QByteArray();
	return data.mid( 0x200, 0x100 );
}
