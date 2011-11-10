Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21D04E00307
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 03:38:40 -0800 (PST)
Received: by wyg34 with SMTP id 34so4609520wyg.35
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 03:38:39 -0800 (PST)
Received: by 10.180.78.2 with SMTP id x2mr8205447wiw.10.1320925119488;
	Thu, 10 Nov 2011 03:38:39 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y3sm243764wiy.3.2011.11.10.03.38.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 03:38:37 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <083BC63EECB6FD41B8E81CF7FD87CC0F04465D@DLEE09.ent.ti.com>
Date: Thu, 10 Nov 2011 12:38:33 +0100
Message-Id: <86203E75-5767-4DC0-B188-7955E69DAE3D@dominion.thruhere.net>
References: <1320905196-2476-1-git-send-email-joelagnel@ti.com>
	<083BC63EECB6FD41B8E81CF7FD87CC0F04465D@DLEE09.ent.ti.com>
To: "Fernandes, Joel A" <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] gadget-init: Add network-gadget services and other fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 11:38:41 -0000
X-Groupsio-MsgNum: 104
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CB6AD0DA-CBA4-4AA8-A941-15C003C470C5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CB6AD0DA-CBA4-4AA8-A941-15C003C470C5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 10 nov. 2011, om 07:08 heeft Fernandes, Joel A het volgende =
geschreven:

>> -----Original Message-----
>> From: Fernandes, Joel A
>> Sent: Thursday, November 10, 2011 12:07 AM
>> To: meta-ti@yoctoproject.org
>> Cc: Fernandes, Joel A; Kridner, Jason
>> Subject: [PATCH] gadget-init: Add network-gadget services and other
>> fixes
>=20
>=20
> Sorry, the title is supposed to have "PATCH v2" prefixed.


I've applied this patch and ran some tests. It pretty much works as =
expected, but I had to make some small cleanups to make the logic work a =
bit better. The showstopper is that g_ether, like g_multi will take up =
100% cpu in rcu_kthread when loaded :(

regards,

Koen=

--Apple-Mail=_CB6AD0DA-CBA4-4AA8-A941-15C003C470C5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk67t7sACgkQMkyGM64RGpGlIwCfcV/1DkRj5Xoka7jZbIHmcnyq
bUUAn3UrrihNE6FCIxEqQFrryfoMQYbH
=+QWK
-----END PGP SIGNATURE-----

--Apple-Mail=_CB6AD0DA-CBA4-4AA8-A941-15C003C470C5--
