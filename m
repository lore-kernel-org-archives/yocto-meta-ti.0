Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A7FBE002AC; Fri, 20 Feb 2015 07:24:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A673E00288
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 07:24:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1KFOgtn030207
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 09:24:42 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KFOeZo014208
	for <meta-ti@yoctoproject.org>; Fri, 20 Feb 2015 09:24:41 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 20 Feb 2015 09:24:40 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 1/2] ti-eula-unpack: Add support for
	general binary installers.
Thread-Index: AQHQQVhn0F1mj0+xoE2UoVoyXkchLJz5VCKAgABox7CAAAJrUA==
Date: Fri, 20 Feb 2015 15:24:39 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140EC9D5@DFLE09.ent.ti.com>
References: <1423150109-9436-1-git-send-email-j-stiffler@ti.com>
	<20150220025837.GH31287@edge>
	<4B26FB5A64EBA14C87266869E037F958140EC9B4@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140EC9B4@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 1/2] ti-eula-unpack: Add support for general binary installers.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Feb 2015 15:24:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried a variety of -Mxx options, but none seemed to work.

Here is the manual diff between the renamed file (ti-eula-unpack.inc --> ti=
-unpack.inc) :


$ diff recipes-ti/includes/ti-eula-unpack.inc recipes-ti/includes/ti-unpack=
.inc
2c2
< # the http and display EULA.
---
> # the http.
4a5
> #  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin fi=
le.
40a42,45
>     # Get unpack args
>     arg_string =3D bb.data.getVar('TI_BIN_UNPK_ARGS', localdata)
>     arg_string =3D bb.data.expand(arg_string, localdata)
>
49c54
<     filename =3D "HOME=3D%s ./%s --mode console" % (workdir, binfile)
---
>     filename =3D "HOME=3D%s ./%s %s" % (workdir, binfile, arg_string)



Thanks,
Jake=20

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Stiffler, Jacob
Sent: Friday, February 20, 2015 10:14 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 1/2] ti-eula-unpack: Add support for gener=
al binary installers.

I had used the "-M" option. I will try with "-Mxx".

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, February 19, 2015 9:59 PM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 1/2] ti-eula-unpack: Add support for gener=
al binary installers.

Jake,

Can you generate this patch with -M or -Mxx where xx is the percentage of s=
imilarities between the 2 files? I'm suspecting it will be much easier to r=
eview the patch...

--
Denys


On Thu, Feb 05, 2015 at 10:28:28AM -0500, Jacob Stiffler wrote:
> * ti-unpack.inc has been created to allow support for general binary
>   installers by creating a variable which is used to pass arbitrary
>   arguments to the executable.
> * ti-eula-unpack.inc sets the default arguments to retain support for
>   recipes which still use this feature.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/includes/ti-eula-unpack.inc |   67 +-------------------------
>  recipes-ti/includes/ti-unpack.inc      |   83 ++++++++++++++++++++++++++=
++++++
>  2 files changed, 85 insertions(+), 65 deletions(-)  create mode=20
> 100644 recipes-ti/includes/ti-unpack.inc
>=20
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc=20
> b/recipes-ti/includes/ti-eula-unpack.inc
> index aee88f1..912cd18 100644
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> @@ -9,70 +9,7 @@
>  #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user want=
s to put
>  #                       the output in some internal directory
> =20
> -python do_unpack () {
> -    bb.build.exec_func('base_do_unpack', d)
> -    bb.build.exec_func('ti_bin_do_unpack', d)
> -}
> +require ../includes/ti-unpack.inc
> =20
> -TI_BIN_UNPK_WDEXT ?=3D ""
> -python ti_bin_do_unpack() {
> -
> -    import os
> -
> -    # InstallJammer requires 32bit version of glibc
> -    lib32path =3D '/lib'
> -    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path=
.islink('/lib') or os.path.exists('/lib32')):
> -        lib32path =3D '/lib32'
> -    if not os.path.exists('%s/libc.so.6' % lib32path):
> -        bb.warn("TI installer requires 32bit glibc libraries for proper =
operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install ia32-=
libs' on Ubuntu/Debian")
> -
> -    localdata =3D bb.data.createCopy(d)
> -    bb.data.update_data(localdata)
> -
> -    binfile  =3D bb.data.getVar('BINFILE', localdata)
> -    binfile  =3D bb.data.expand(binfile, localdata)
> -
> -    # Change to the working directory
> -    save_cwd =3D os.getcwd()
> -    workdir  =3D bb.data.getVar('WORKDIR', localdata)
> -    workdir  =3D bb.data.expand(workdir, localdata)
> -    os.chdir(workdir)
> -
> -    # Get unpack commands
> -    cmd_string =3D bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
> -    cmd_list =3D cmd_string.split( ":" )
> -
> -    # Make the InstallJammer binary executable so we can run it
> -    os.chmod(binfile, 0755)
> -
> -    # Run the InstallJammer binary and accept the EULA
> -    filename =3D "HOME=3D%s ./%s --mode console" % (workdir, binfile)
> -   =20
> -    # Test executable by printing installer version or help screen (--ve=
rsion currently broken for some installers)=20
> -    # - this is currently broken in some IJ installers - comment out for=
 now
> -    #if os.system(filename + " --version") !=3D 0:
> -    #   print "ERROR: ti-eula-unpack: failed to execute binary installer=
"
> -    #   raise bb.build.FuncFailed()
> -=20
> -    f =3D os.popen(filename,'w')
> -    for cmd in cmd_list:
> -        if cmd =3D=3D "workdir":
> -            wdext =3D bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
> -            wdext =3D bb.data.expand(wdext, localdata)
> -            cmd =3D workdir+wdext
> -        f.write(cmd+'\n');
> -    f.close()
> -
> -    # Expand the tarball that was created if required
> -    tarfile  =3D bb.data.getVar('TARFILE', localdata)   =20
> -    if bool(tarfile) =3D=3D True:
> -        tarfile  =3D bb.data.expand(tarfile, localdata)
> -        tcmd =3D 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir=
)
> -        if os.system(tcmd) !=3D 0:
> -            print "ERROR: ti-eula-unpack: failed to extract tarfile"
> -            raise bb.build.FuncFailed()
> -
> -    # Return to the previous directory
> -    os.chdir(save_cwd)
> -}
> +TI_BIN_UNPK_ARGS =3D "--mode console"
> =20
> diff --git a/recipes-ti/includes/ti-unpack.inc=20
> b/recipes-ti/includes/ti-unpack.inc
> new file mode 100644
> index 0000000..c19c78c
> --- /dev/null
> +++ b/recipes-ti/includes/ti-unpack.inc
> @@ -0,0 +1,83 @@
> +# This file defines function used for unpacking the .bin file=20
> +downloaded over # the http.
> +#  BINFILE - name of the install jammer .bin file #  TARFILE - name=20
> +of the tar file inside the install jammer
> +#  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin f=
ile.
> +#  TI_BIN_UNPK_CMDS   - contains list of commands separated with colon t=
o be=20
> +#                       passed while unpacking the bin file. The keyword=
=20
> +#                       workdir expands to WORKDIR and commands are appe=
ndded
> +#                       with '\n'. Eg. TI_BIN_UNPK_CMDS=3D"Y:Y: qY:workd=
ir"
> +#  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user want=
s to put
> +#                       the output in some internal directory
> +
> +python do_unpack () {
> +    bb.build.exec_func('base_do_unpack', d)
> +    bb.build.exec_func('ti_bin_do_unpack', d) }
> +
> +TI_BIN_UNPK_WDEXT ?=3D ""
> +python ti_bin_do_unpack() {
> +
> +    import os
> +
> +    # InstallJammer requires 32bit version of glibc
> +    lib32path =3D '/lib'
> +    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path=
.islink('/lib') or os.path.exists('/lib32')):
> +        lib32path =3D '/lib32'
> +    if not os.path.exists('%s/libc.so.6' % lib32path):
> +        bb.warn("TI installer requires 32bit glibc libraries for=20
> + proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get=20
> + install ia32-libs' on Ubuntu/Debian")
> +
> +    localdata =3D bb.data.createCopy(d)
> +    bb.data.update_data(localdata)
> +
> +    binfile  =3D bb.data.getVar('BINFILE', localdata)
> +    binfile  =3D bb.data.expand(binfile, localdata)
> +
> +    # Change to the working directory
> +    save_cwd =3D os.getcwd()
> +    workdir  =3D bb.data.getVar('WORKDIR', localdata)
> +    workdir  =3D bb.data.expand(workdir, localdata)
> +    os.chdir(workdir)
> +
> +    # Get unpack args
> +    arg_string =3D bb.data.getVar('TI_BIN_UNPK_ARGS', localdata)
> +    arg_string =3D bb.data.expand(arg_string, localdata)
> +
> +    # Get unpack commands
> +    cmd_string =3D bb.data.getVar('TI_BIN_UNPK_CMDS', localdata)
> +    cmd_list =3D cmd_string.split( ":" )
> +
> +    # Make the InstallJammer binary executable so we can run it
> +    os.chmod(binfile, 0755)
> +
> +    # Run the InstallJammer binary and accept the EULA
> +    filename =3D "HOME=3D%s ./%s %s" % (workdir, binfile, arg_string)
> +   =20
> +    # Test executable by printing installer version or help screen (--ve=
rsion currently broken for some installers)=20
> +    # - this is currently broken in some IJ installers - comment out for=
 now
> +    #if os.system(filename + " --version") !=3D 0:
> +    #   print "ERROR: ti-eula-unpack: failed to execute binary installer=
"
> +    #   raise bb.build.FuncFailed()
> +=20
> +    f =3D os.popen(filename,'w')
> +    for cmd in cmd_list:
> +        if cmd =3D=3D "workdir":
> +            wdext =3D bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
> +            wdext =3D bb.data.expand(wdext, localdata)
> +            cmd =3D workdir+wdext
> +        f.write(cmd+'\n');
> +    f.close()
> +
> +    # Expand the tarball that was created if required
> +    tarfile  =3D bb.data.getVar('TARFILE', localdata)   =20
> +    if bool(tarfile) =3D=3D True:
> +        tarfile  =3D bb.data.expand(tarfile, localdata)
> +        tcmd =3D 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir=
)
> +        if os.system(tcmd) !=3D 0:
> +            print "ERROR: ti-eula-unpack: failed to extract tarfile"
> +            raise bb.build.FuncFailed()
> +
> +    # Return to the previous directory
> +    os.chdir(save_cwd)
> +}
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

