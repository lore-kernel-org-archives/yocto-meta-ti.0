Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id DBBAAE00305
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2011 15:22:04 -0800 (PST)
Received: (qmail invoked by alias); 19 Dec 2011 23:22:02 -0000
Received: from p5B0A29E0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.224]
	by mail.gmx.net (mp024) with SMTP; 20 Dec 2011 00:22:02 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX191uNEtQQV1xJXBjd4aYOuNwRBg/nDv3X0P1d5NmM
	ftBP+H3+WbFtda
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Dec 2011 00:22:44 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201112200022.45166.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 1/5] linux.inc: If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use the 'lzop' utility to do the lzo compression, but we should not be relying on that utility being installed on the build machine.
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
X-List-Received-Date: Mon, 19 Dec 2011 23:22:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, December 19, 2011 05:15:36 PM Koen Kooi wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This currently affects the linux-omap4 build for omap4430-panda.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-kernel/linux/linux.inc |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux.inc
> b/recipes-kernel/linux/linux.inc index 9650e68..e8a754f 100644
> --- a/recipes-kernel/linux/linux.inc
> +++ b/recipes-kernel/linux/linux.inc
> @@ -264,3 +264,14 @@ pkg_postrm_kernel-devicetree () {
>  	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree
> devicetree-${KERNEL_VERSION} || true }
>=20
> +# Automatically depend on lzop-native if CONFIG_KERNEL_LZO is enabled
> +python () {
> +    try:
> +        defconfig =3D bb.fetch2.localpath('file://defconfig', d)
> +    except bb.fetch2.FetchError:
> +        pass
> +    else:
> +        if 'CONFIG_KERNEL_LZO=3Dy\n' in open(defconfig).readlines():
> +            depends =3D d.getVar('DEPENDS', False)
> +            d.setVar('DEPENDS', depends + ' lzop-native')
> +}
I am afraid since this patch I get

ERROR: Unable to parse /home/Superandy/data/oe-core/sources/meta-ti/recipes-
kernel/linux/linux_3.1.bb########################                          =
                                         =20
| ETA:  00:00:00
Traceback (most recent call last):
  File "/home/Superandy/oe-core/sources/bitbake/lib/bb/parse/ast.py", line =
379,=20
in multi_finalize(fn=3D'/home/Superandy/data/oe-core/sources/meta-ti/recipe=
s-
kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at 0x6e5e39=
0>):
         try:
    >        finalize(fn, d)
         except bb.parse.SkipPackage as e:
  File "/home/Superandy/oe-core/sources/bitbake/lib/bb/parse/ast.py", line =
323,=20
in finalize(fn=3D'/home/Superandy/data/oe-core/sources/meta-ti/recipes-
kernel/linux/linux_3.1.bb', d=3D<bb.data_smart.DataSmart object at 0x6e5e39=
0>,=20
variant=3DNone):
             code.append("%s(d)" % funcname)
    >    bb.utils.simple_exec("\n".join(code), {"d": d})
         bb.data.update_data(d)
  File "/home/Superandy/oe-core/sources/bitbake/lib/bb/utils.py", line 387,=
 in=20
simple_exec(code=3D'__anon_119__home_Superandy_data_oe_core_sources_openemb=
edded_core_meta_classes_staging_bbclass(d)\n__anon_487__home_Superandy_data=
_oe_core_sources_openembedded_core_meta_classes_base_bbclass(d)\n__anon_20_=
_home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_debian_=
bbclass(d)\n__anon_19__home_Superandy_data_oe_core_sources_meta_openembedde=
d_meta_oe_classes_blacklist_bbclass(d)\n__anon_189__home_Superandy_data_oe_=
core_sources_openembedded_core_meta_classes_package_bbclass(d)\n__anon_55__=
home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_sstate_b=
bclass(d)\n__anon_447__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta_classes_package_ipk_bbclass(d)\n__anon_28__home_Superandy_data_oe_co=
re_sources_meta_openembedded_meta_oe_classes_kernel_bbclass(d)\n__anon_119_=
_home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_siteinf=
o_bbclass(d)\n__anon_72__home_Superandy_data_oe_core_sources_meta_ti_recipe=
s_kernel_linux_linux_inc(d)\n__anon_277__home_Superandy_data_oe_core_source=
s_meta_ti_recipes_kernel_linux_linux_inc(d)',=20
context=3D{'d': <bb.data_smart.DataSmart object at 0x6e5e390>}):
     def simple_exec(code, context):
    >    exec(code, _context, context)
    =20
  File "<string>", line 11, in <module>
  File=20
"__anon_277__home_Superandy_data_oe_core_sources_meta_ti_recipes_kernel_lin=
ux_linux_inc",=20
line 7, in=20
__anon_277__home_Superandy_data_oe_core_sources_meta_ti_recipes_kernel_linu=
x_linux_inc(d=3D<bb.data_smart.DataSmart=20
object at 0x6e5e390>)
IOError: [Errno 2] No such file or directory:=20
'/home/Superandy/data/Downloads/packets/dl/defconfig'

Hints:

* reverting fixed issue
* /home/Superandy/data/Downloads/packets/dl is my download directory

Andreas

