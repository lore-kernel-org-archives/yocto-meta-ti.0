Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.49618.1628949326465993739
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 14 Aug 2021 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=bn3lE6os;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.21, mailfrom: paul@pbarker.dev)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 9ACE3320016F;
	Sat, 14 Aug 2021 09:55:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 14 Aug 2021 09:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type; s=fm1; bh=JpHfdge0/LfqOn7fXiFKU4YeDC
	l5aPk6tgB5JO83hZ0=; b=bn3lE6osYKe6UnssJIosO9JlHxz8WGCDcpBsaB9Qze
	IMhSQ2gMVeqq5ykse4gQuD7mi6tTAg1pm5ST9YgNEDap+1P5jZ+RmUM0okdlQdX2
	042N0L3fnaNZPu7ebIddFYdK0969Y+/NQWYKGVxaTWrwhTj0b2cqRghxxcEw4YUy
	BBmfLyoAHMBs9W5i1HeotpoiWMqsSn3I8ffFr9hbeZwDdAczMu5Jq9uI3mJWPWOn
	HZB39fvdhkrFnIfUw+R7bFWK0xxeUr3jfoeCADTjYLHiKTMS7faHUSHd+py4dijo
	BCMPChP/Tan7nZOpbGLXoWGDKQUj8YEjB4Y9t6L/pYLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JpHfdg
	e0/LfqOn7fXiFKU4YeDCl5aPk6tgB5JO83hZ0=; b=WOmcO2n+TPiGILgk9kkw3x
	hvvNXHCcOhpvhFejD4OjQIGh9mp7Yp5qkpNAf1NV4BzfSxHX4WolMht4/ybe6Yz7
	zq4+ZxrtFhJ7i7goCkyxXAnEW9UEFvGnepRnSF6K6LJM6i+ags+d0AwY0kh6+C2l
	2Yify3RP/Qh87FdHKDB2FbSTIWf4lsPdoTRf9neMBiNvVNDtpkkjW9b6EbfeMJra
	MH8AT/+5eyDT54/E/2NS+nH9KipRnvk3oB5oz9toWEgYNGWoFLT6BgJBMolVeYGD
	wOjqM3sZMQP1aHaGgz7YMX8VFQWOi96M3rrXyvoRt4E7ZKSKEAE3/7llItnb62Pw
	==
X-ME-Sender: <xms:TMsXYf9QNCxdeRzjcz38AdG3-aHPvYVoXDcJrqC7ca9K8hg_TK_IHQ>
    <xme:TMsXYbuyFehgH1Cd2THZqwKSlLMjHRYe5BHCZ2v7gS9WlOew7CoZrpMOUdvbN3gAB
    euJ7Ab5nlI8jpNzjVk>
X-ME-Received: <xmr:TMsXYdBzlTXV3gMO8QErNpjd-xY8_is8k-9kGfrxFDCR3E_6sf0LHOg3Y8qHwg-QjaKhg6IdOqtPpqtw4lN2Gsuz5RVUs_DOkmsI_X1mIs8oW083iL6hud0smJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeejgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epheetjeeihfehleefhfejheeftedttdehueffieefjeefgedvvdeuueffieetuedvnecu
    ffhomhgrihhnpehpsggrrhhkvghrrdguvghvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:TMsXYbebUn9oj8ym-qU6hUF7TcIiJxiBk2pJvhtcBWIbE63UKH2HpQ>
    <xmx:TMsXYUN7Cunzhjiz61WUrM0E0bIbpPVrkuHLwP-RxIrrMqv7qzkgrA>
    <xmx:TMsXYdlJ3-DAtOaA835HW6_mhp6LA3c3_vD52nRe_3r-Eo8at6mnfQ>
    <xmx:TcsXYe3GJv78ktrkUXFh1NQtCh8pbEInBgZ0n-Qy2T-Gk8WSdFqgVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Aug 2021 09:55:23 -0400 (EDT)
Date: Sat, 14 Aug 2021 14:55:13 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: "Denys Dmytriyenko" <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH v4] meta-ti: convert to new override syntax in honister
Message-ID: <20210814145153.26140c02.paul@pbarker.dev>
In-Reply-To: <1628707145-50420-1-git-send-email-denis@denix.org>
References: <1628707145-50420-1-git-send-email-denis@denix.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Groupsio-MsgNum: 13989
Content-Type: multipart/signed; boundary="Sig_/ZxR5ZG6w/Ud0uk9pNVoDPxN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZxR5ZG6w/Ud0uk9pNVoDPxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Aug 2021 14:39:05 -0400
"Denys Dmytriyenko" <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Upcoming "honister" release changes the override syntax to improve usabil=
ity,
> speed and memory footprint. Update recipes with the new syntax and set la=
yer
> compatibility to honister.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Tested-by: Paul Barker <paul.barker@sancloud.com>

All,

The current status is that the master branch of meta-ti does not build
against the current Yocto Project master branch. I recommend moving
ahead and merging this override conversion sooner rather than later -
if there are any remaining issues they can be fixed in follow up
commits. Merging this patch as-is should at least unblock most users of
meta-ti.

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/ZxR5ZG6w/Ud0uk9pNVoDPxN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYRfLQQAKCRCrY1Tsnbr0
btSEAP9iNWXu4Simf1Sn+YaaUrMso+NF8SKheUCW2PaJowriEgEAkpsIeHZHkxbx
qnfePH2nxbpuiZ1cZpGN9ImkM/Kd1w8=
=2q1D
-----END PGP SIGNATURE-----

--Sig_/ZxR5ZG6w/Ud0uk9pNVoDPxN--
