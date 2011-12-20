Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A6FE7E01217
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 02:15:34 -0800 (PST)
Received: (qmail invoked by alias); 20 Dec 2011 10:15:30 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp008) with SMTP; 20 Dec 2011 11:15:30 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ifZBria7i/TDec+vFWT8FGX0LJmrNj4GHiwC/g2
	PJ3DY845jOAUy8
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Dec 2011 11:15:38 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.4-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201112201115.39033.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: commit b72cb13fcf83b9d342808ea30379bfb6a1321b54 breaks parse
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
X-List-Received-Date: Tue, 20 Dec 2011 10:15:35 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I thought I sent it alrerady but cannot find it in mailing archive. If you =
have=20
already received simply ignore.

On all my build machines  I get

Loading cache: 100% |
###########################################################################=
###################################################################|=20
ETA:  00:00:00
Loaded 1880 entries from dependency cache.
ERROR: Unable to parse /home/andreas/data/oe-core/sources/meta-ti/recipes-
kernel/linux/linux_3.1.bb                                                  =
             =20
| ETA:  --:--:--
Traceback (most recent call last):
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/parse/ast.py", line 37=
9,=20
in multi_finalize(fn=3D'/home/andreas/data/oe-core/sources/meta-ti/recipes-
kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at 0x7cec6d=
0>):
         try:
    >        finalize(fn, d)
         except bb.parse.SkipPackage as e:
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/parse/ast.py", line 32=
3,=20
in finalize(fn=3D'/home/andreas/data/oe-core/sources/meta-ti/recipes-
kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at 0x7cec6d=
0>,=20
variant=3DNone):
             code.append("%s(d)" % funcname)
    >    bb.utils.simple_exec("\n".join(code), {"d": d})
         bb.data.update_data(d)
  File "/home/andreas/oe-core/sources/bitbake/lib/bb/utils.py", line 387, i=
n=20
simple_exec(code=3D'__anon_119__home_andreas_data_oe_core_sources_openembed=
ded_core_meta_classes_staging_bbclass(d)\n__anon_487__home_andreas_data_oe_=
core_sources_openembedded_core_meta_classes_base_bbclass(d)\n__anon_20__hom=
e_andreas_data_oe_core_sources_openembedded_core_meta_classes_debian_bbclas=
s(d)\n__anon_19__home_andreas_data_oe_core_sources_meta_openembedded_meta_o=
e_classes_blacklist_bbclass(d)\n__anon_189__home_andreas_data_oe_core_sourc=
es_openembedded_core_meta_classes_package_bbclass(d)\n__anon_55__home_andre=
as_data_oe_core_sources_openembedded_core_meta_classes_sstate_bbclass(d)\n_=
_anon_447__home_andreas_data_oe_core_sources_openembedded_core_meta_classes=
_package_ipk_bbclass(d)\n__anon_28__home_andreas_data_oe_core_sources_meta_=
openembedded_meta_oe_classes_kernel_bbclass(d)\n__anon_119__home_andreas_da=
ta_oe_core_sources_openembedded_core_meta_classes_siteinfo_bbclass(d)\n__an=
on_72__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linux_linux=
_inc(d)\n__anon_277__home_andreas_data_oe_core_sources_meta_ti_recipes_kern=
el_linux_linux_inc(d)',=20
context=3D{'d': <bb.data_smart.DataSmart object at 0x7cec6d0>}):
     def simple_exec(code, context):
    >    exec(code, _context, context)
    =20
  File "<string>", line 11, in <module>
  File=20
"__anon_277__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linux=
_linux_inc",=20
line 7, in=20
__anon_277__home_andreas_data_oe_core_sources_meta_ti_recipes_kernel_linux_=
linux_inc(d=3D<bb.data_smart.DataSmart=20
object at 0x7cec6d0>)
IOError: [Errno 2] No such file or directory:=20
'/home/andreas/data/Downloads/packets/dl/defconfig'

Notes:

* /home/andreas/data/Downloads/packets/dl is my download directory
* reverting b72cb13fcf83b9d342808ea30379bfb6a1321b54 fixed build

Andreas

