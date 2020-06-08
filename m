Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1318.1591647404024409518
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 13:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=yuIaBvi8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058KGgde013066;
	Mon, 8 Jun 2020 15:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591647402;
	bh=T9xrTx21+b4I6jynSWBcdxsYtQBCsCLsyoBWue9F2rI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yuIaBvi8yguZSkZByuDa+H7/2OUR380jiAKRp3adi+yTtxSVZc8G4ITzPMsIGsUpv
	 3UddwhzstrctLIxDXEUKs4JzN6uI5pmViuW7KllBqCnUT+PXB2S7tKfwEFvZ8rMfFT
	 KyAKR4TTP+d0tFa8NGawXjXb7p6wxdUSV3w/9imI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058KGgqF051769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 15:16:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 15:16:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 15:16:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058KGgxT116515;
	Mon, 8 Jun 2020 15:16:42 -0500
Date: Mon, 8 Jun 2020 16:16:41 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Luca <magnabosco.luca@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, "Andrew F. Davis" <afd@ti.com>
Subject: Re: [meta-ti] Inverted colors in Qt application with beaglebone/am335x and QT_QPA_PLATFORM=eglfs
Message-ID: <20200608201641.GA10922@beryl>
References: <PmuX.1591349021569680074.VluT@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <PmuX.1591349021569680074.VluT@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 058KGgde013066
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Luca,

Thank you for your report. There have been few similar reports on TI E2E=
=20
forums (https://e2e.ti.com/) and our team is looking into this issue. You=
=20
might want to follow corresponding discussions there for any latest update=
s,=20
but once this gets resolved, it will be picked up by meta-ti.

One more note - there are no more updates planned for "zeus" branch, as we=
=
=20
have migrated to the latest LTS release "dunfell".

Thanks.

--=20
Denys


On Fri, Jun 05, 2020 at 02:23:41AM -0700, Luca wrote:
> Hi all,
>=20
> running some QT applications with `QT_QPA_PLATFORM=3Deglfs` and ` QT_QPA=
_EGLFS_INTEGRATION=3Deglfs_kms ` I am experiencing some issues:
>=20
> * running Qt5_CinematicExperience the red and blue color are inverted. A=
part from that the application seems to rung just fine
> * running qtwebbrowser 5.13.2 ( git://code.qt.io/qt-apps/qtwebbrowser.gi=
t ) the red and blue color are inverted and the webpage refresh seems to be=
 very slow
>=20
> Using:
>=20
> * meta-ti tag ti2020.00 branch zeus
> * qt configured exactly as it is done in meta-arago tag ti2020.00, witho=
ut `wayland` in `DISTRO_FEATURES`
> * poky: branch zeus, commit ca9cc50
> * meta-openembedded: branch zeus, commit 44e458f
> * MACHINE set to beaglebone
>=20
> Notes:
>=20
> * Considering TI SDK guide ( http://software-dl.ti.com/processor-sdk-lin=
ux/esd/docs/latest/linux/Foundational_Components/Graphics/AM3_Beagle_Bone_B=
lack_Configuration.html#am3-beagle-bone-black-board-configuration ) I tried=
 to update the `etc/powervr.ini` setting DefaultPixelFormat=3DRGB565 but it=
 seems the change
> * I tried to set ` "format": "rgb565"` in=A0eglfs_kms_cfg.json but that =
causes an error when running with "-platform eglfs" (or QT_QPA_PLATFORM=3De=
glfs)
>=20
> qt.qpa.eglfs.kms: Creating gbm_surface for screen LVDS1
> EGL Error : Could not create the egl surface: error =3D 0x3009
>=20
> Any suggestion would be very appreciated.
>=20
> Regards
> Luca

>=20

