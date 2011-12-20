Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44536E01217
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 02:31:53 -0800 (PST)
Received: by wibhq4 with SMTP id hq4so1842806wib.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 02:31:52 -0800 (PST)
Received: by 10.180.81.72 with SMTP id y8mr3343317wix.14.1324377112775;
	Tue, 20 Dec 2011 02:31:52 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ei9sm3296974wid.0.2011.12.20.02.31.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 02:31:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201112201115.39033.schnitzeltony@gmx.de>
Date: Tue, 20 Dec 2011 11:31:47 +0100
Message-Id: <FEF0BC67-DB90-448F-B36A-F847037D4CBE@dominion.thruhere.net>
References: <201112201115.39033.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <Schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: commit b72cb13fcf83b9d342808ea30379bfb6a1321b54 breaks parse
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
X-List-Received-Date: Tue, 20 Dec 2011 10:31:54 -0000
X-Groupsio-MsgNum: 264
Content-Type: multipart/signed;
	boundary="Apple-Mail=_496DA1D7-5972-4A7E-9514-63CD58C6A441";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_496DA1D7-5972-4A7E-9514-63CD58C6A441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 20 dec. 2011, om 11:15 heeft Andreas M=FCller het volgende =
geschreven:

> Hi,
>=20
> I thought I sent it alrerady but cannot find it in mailing archive. If =
you have=20
> already received simply ignore.
>=20
> On all my build machines  I get
>=20
> Loading cache: 100% |
> =
##########################################################################=
####################################################################|=20
> ETA:  00:00:00
> Loaded 1880 entries from dependency cache.
> ERROR: Unable to parse =
/home/andreas/data/oe-core/sources/meta-ti/recipes-
> kernel/linux/linux_3.1.bb                                              =
                 =20
> | ETA:  --:--:--
> Traceback (most recent call last):
>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/parse/ast.py", =
line 379,=20
> in =
multi_finalize(fn=3D'/home/andreas/data/oe-core/sources/meta-ti/recipes-
> kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at =
0x7cec6d0>):
>         try:
>>       finalize(fn, d)
>         except bb.parse.SkipPackage as e:
>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/parse/ast.py", =
line 323,=20
> in finalize(fn=3D'/home/andreas/data/oe-core/sources/meta-ti/recipes-
> kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at =
0x7cec6d0>,=20
> variant=3DNone):
>             code.append("%s(d)" % funcname)
>>   bb.utils.simple_exec("\n".join(code), {"d": d})
>         bb.data.update_data(d)
>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/utils.py", line =
387, in=20
> =
simple_exec(code=3D'__anon_119__home_andreas_data_oe_core_sources_openembe=
dded_core_meta_classes_staging_bbclass(d)\n__anon_487__home_andreas_data_o=
e_core_sources_openembedded_core_meta_classes_base_bbclass(d)\n__anon_20__=
home_andreas_data_oe_core_sources_openembedded_core_meta_classes_debian_bb=
class(d)\n__anon_19__home_andreas_data_oe_core_sources_meta_openembedded_m=
eta_oe_classes_blacklist_bbclass(d)\n__anon_189__home_andreas_data_oe_core=
_sources_openembedded_core_meta_classes_package_bbclass(d)\n__anon_55__hom=
e_andreas_data_oe_core_sources_openembedded_core_meta_classes_sstate_bbcla=
ss(d)\n__anon_447__home_andreas_data_oe_core_sources_openembedded_core_met=
a_classes_package_ipk_bbclass(d)\n__anon_28__home_andreas_data_oe_core_sou=
rces_meta_openembedded_meta_oe_classes_kernel_bbclass(d)\n__anon_119__home=
_andreas_data_oe_core_sources_openembedded_core_meta_classes_siteinfo_bbcl=
ass(d)\n__anon_72__home_andreas_data_oe_core_sources_meta_ti_recipes_kerne=
l_linux_linux_inc(d)\n__anon_2
> =
77__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linux_linux_i=
nc(d)',=20
> context=3D{'d': <bb.data_smart.DataSmart object at 0x7cec6d0>}):
>     def simple_exec(code, context):
>>   exec(code, _context, context)
>=20
>  File "<string>", line 11, in <module>
>  File=20
> =
"__anon_277__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linu=
x_linux_inc",=20
> line 7, in=20
> =
__anon_277__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linux=
_linux_inc(d=3D<bb.data_smart.DataSmart=20
> object at 0x7cec6d0>)
> IOError: [Errno 2] No such file or directory:=20
> '/home/andreas/data/Downloads/packets/dl/defconfig'

I'm not seeing any of that, but I'm keeping an eye on it.=

--Apple-Mail=_496DA1D7-5972-4A7E-9514-63CD58C6A441
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7wZBkACgkQMkyGM64RGpGpPwCcCk4Yj+hxmUVeW2Jz3XOA1V4f
5TsAoLJc5ER1i6INwEDsXeOjOpGQCSYg
=KAnW
-----END PGP SIGNATURE-----

--Apple-Mail=_496DA1D7-5972-4A7E-9514-63CD58C6A441--
