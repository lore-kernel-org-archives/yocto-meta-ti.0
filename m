Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 360E1E016AE
	for <meta-ti@yoctoproject.org>; Thu,  3 Oct 2013 21:41:40 -0700 (PDT)
Received: by mail-ee0-f43.google.com with SMTP id e52so1532520eek.30
	for <meta-ti@yoctoproject.org>; Thu, 03 Oct 2013 21:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1TFmtTMN/UX8ZpIvKyKTIa1eYwTuikwwKVtHsGgU4Xk=;
	b=RBb4mzym8iI1R0jgkkyVyn37jBAug5rPyDqBJSTiWjtkUoel3O/iEAEelca/GBlxLr
	LRs/5/WaEAt0vM96DP2+eH5FSNkBrDnIx2JT7LfNKEclu1j/ZTUmE4jT5QN+OW96iJxz
	9FQ2JsIQ4x9RMrmP0ORLZVoD6Gig3/SzUK0tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=1TFmtTMN/UX8ZpIvKyKTIa1eYwTuikwwKVtHsGgU4Xk=;
	b=gw3uqhIv/0L1o8pK1p1vZeT84mblQkfoSnUfItipIx/MlsTqaQvNp2miqhcIMHlqdc
	GT1Bg27G35fkNteLQ6IuS3BegFoqw5TMC0n8xKnxyDrT2DZMBRZMPquLnDiUpg0lMKOJ
	+zQuFfUlRa26pk8T0GlyxUjJlG1fF2XkBhG3+V22RKPbu96cMH66jpPf03Ou0LNi3Ccg
	AzX1aT/sV8czhm8fxzOiQm0dUYJQkeJomfmPu7CXvTKbxcytCD9EUfrDLkEolwZPl7NV
	ahDrElOV3JlAu+5KDEC8KDw+q0NH/3ozcBQMvLW5K7dpLV/OJB5o4BvPE0xvykS5Ex1v
	3FRA==
X-Gm-Message-State: ALoCoQlffwCxs3DRQD51pZN75OCndoq//XtDr2pCphfasMUr3bZ+sS1lApM3QmE831x+/8xcY/wz
MIME-Version: 1.0
X-Received: by 10.14.225.199 with SMTP id z47mr18767774eep.24.1380861698591;
	Thu, 03 Oct 2013 21:41:38 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Thu, 3 Oct 2013 21:41:38 -0700 (PDT)
Date: Thu, 3 Oct 2013 21:41:38 -0700
Message-ID: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: meta-ti@yoctoproject.org
Subject: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 04:41:41 -0000
Content-Type: multipart/alternative; boundary=047d7b66fc0f0784fc04e7e2ebfe

--047d7b66fc0f0784fc04e7e2ebfe
Content-Type: text/plain; charset=ISO-8859-1

I tried to build a system for the AM335x_EVM board using the meta-ti layer
with YP 1.4.2 Dylan. Here are the steps:

   1. Clone meta-ti layer
   2. Check out dylan branch
   3. Set up build environment, add meta-ti layer
   4. Set MACHINE = "am335x_evm"
   5. bitbake -k core-image-minimal

Everything builds, put on target, u-boot comes up, hangs at "Starting Linux
kernel...". Most likely machine type mismatch. Start digging around:

   1. The am335x_evm.conf machine configuration includes the ti33x.inc file.
   2. ti33x.inc sets
   PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
   PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
   3. The build process uses linux-ti-staging_git.bb and configures the
   kernel using the defconfig found in the llnux-ti-staging subdir.
   Content: use-kernel-config=omap2plus_defconfig. Why would I want to
   configure the Sitara SOC with an OMAP defconfig?
   4. Checking kernel build environment
   in tmp/work/am335x_evm-poky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256/git.
   From SRCREV it seems to be a 3.11/3.12 kernel:
      1. Check arm/arch/tools/mach-types: found:
      tam335x                 MACH_TAM335X            TAM335X
        4116
      Expected to find
      am335xevm               MACH_AM335XEVM          AM335XEVM
        3589 as it was for the 3.2.32 kernel.
      2. Check arm/arch/configs for am335x_evm_defconfig which does not
      exist. Expected to see an am335x_evm_defconfig as found it in a 3.2.32
      kernel.
   5. Checking u-boot build environment which uses, as expected, the
   am335c_evm configuration which sets the machine type to 3589.

I may be missing something but it looks to me as if the layer is broken for
building for the AM335X_EVM target machine.

Thanks for your help,
Rudi

--047d7b66fc0f0784fc04e7e2ebfe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><font face=3D"garamond, serif"><span=
 style=3D"border-collapse:collapse;color:rgb(102,102,102);font-family:arial=
,sans-serif;font-size:13px">I tried to build a system for the AM335x_EVM bo=
ard using the meta-ti layer with YP 1.4.2 Dylan. Here are the steps:</span>=
</font></div>
<div><ol><li><font color=3D"#666666" face=3D"arial, sans-serif">Clone meta-=
ti layer</font></li><li><font color=3D"#666666" face=3D"arial, sans-serif">=
Check out dylan branch</font></li><li><font color=3D"#666666" face=3D"arial=
, sans-serif">Set up build environment, add meta-ti layer</font></li>
<li><font color=3D"#666666" face=3D"arial, sans-serif">Set MACHINE =3D &quo=
t;am335x_evm&quot;</font></li><li><font color=3D"#666666" face=3D"arial, sa=
ns-serif">bitbake -k core-image-minimal</font></li></ol><div><font color=3D=
"#666666" face=3D"arial, sans-serif">Everything builds, put on target, u-bo=
ot comes up, hangs at &quot;Starting Linux kernel...&quot;. Most likely mac=
hine type mismatch. Start digging around:</font></div>
</div><div><ol><li><font color=3D"#666666" face=3D"arial, sans-serif">The a=
m335x_evm.conf machine configuration includes the ti33x.inc file.</font></l=
i><li><font color=3D"#666666" face=3D"arial, sans-serif">ti33x.inc sets=A0<=
br></font><span style=3D"color:rgb(102,102,102);font-family:arial,sans-seri=
f">PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-ti-staging&quot;<br>
</span><span style=3D"color:rgb(102,102,102);font-family:arial,sans-serif">=
PREFERRED_PROVIDER_virtual/bootloader =3D &quot;u-boot-ti-staging&quot;<br>=
</span><span style=3D"color:rgb(102,102,102);font-family:arial,sans-serif">=
PREFERRED_PROVIDER_u-boot =3D &quot;u-boot-ti-staging&quot;</span></li>
<li>The build process uses <a href=3D"http://linux-ti-staging_git.bb">linux=
-ti-staging_git.bb</a> and configures the kernel using the defconfig found =
in the llnux-ti-staging subdir. Content:=A0use-kernel-config=3Domap2plus_de=
fconfig. Why would I want to configure the Sitara SOC with an OMAP defconfi=
g?</li>
<li>Checking kernel build environment in=A0tmp/work/am335x_evm-poky-linux-g=
nueabi/linux-ti-staging/3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c4=
07a6980f4f1c1c574256/git. From SRCREV it seems to be a 3.11/3.12 kernel:</l=
i>
<ol><li>Check arm/arch/tools/mach-types: found:<br>tam335x =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 MACH_TAM335X =A0 =A0 =A0 =A0 =A0 =A0TAM335X =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 4116<br>Expected to find<br>am335xevm =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 MACH_AM335XEVM =A0 =A0 =A0 =A0 =A0AM335XEVM =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 3589 as it was for the 3.2.32 kernel.<br>
</li><li>Check arm/arch/configs for am335x_evm_defconfig which does not exi=
st. Expected to see an am335x_evm_defconfig as found it in a 3.2.32 kernel.=
</li></ol><li>Checking u-boot build environment which uses, as expected, th=
e am335c_evm configuration which sets the machine type to 3589.</li>
</ol>I may be missing something but it looks to me as if the layer is broke=
n for building for the AM335X_EVM target machine.</div><div><br></div><div>=
Thanks for your help,</div><div>Rudi</div></div>
</div>

--047d7b66fc0f0784fc04e7e2ebfe--
