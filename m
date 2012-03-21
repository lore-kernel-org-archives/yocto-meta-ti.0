Return-Path: <marco.monguzzi@gmail.com>
Received: from mail-vx0-f176.google.com (mail-vx0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69D67E00747
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 07:58:45 -0700 (PDT)
Received: by vcbfl17 with SMTP id fl17so1777493vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=gTFmsKDo96v80kd56VkwFTmMKXm+A/8xDCXX2LiCD6c=;
	b=CjS0n6/JGbIcE2dmd32wvQHAatphYbax5x6WEZilCao950IxZuCJFlyeZDg8e3l5x+
	PS20FR75QsG3Kyyq1VWt2VL0i5rsx5kpwHY8Wtv0kVCtM57nqTYVtloa0txqzJMN+HON
	mL8Xo/PGJFcXrnFFWT+vAENoUss6oAu9OPZc0MQWBCmvHkQF7QD1aVdV5LInqvEuHNpl
	ENYkEoMPKa/Y+M1Q+aPNSZys60tLYeOECW4KL1Exb0tSGMBKh4Fdqhtkl4oAQqjx8db6
	j44GPoigL8iJD+aoDS/VK9AGTL9OHTADDBs65JRqQlCx1WQdEmAcTsQaDU6dJlpJpmEa
	7F5A==
MIME-Version: 1.0
Received: by 10.220.151.134 with SMTP id c6mr2224262vcw.30.1332341924474; Wed,
	21 Mar 2012 07:58:44 -0700 (PDT)
Received: by 10.220.192.6 with HTTP; Wed, 21 Mar 2012 07:58:44 -0700 (PDT)
Date: Wed, 21 Mar 2012 15:58:44 +0100
Message-ID: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
From: Marco Monguzzi <marco.monguzzi@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Wed, 21 Mar 2012 08:01:49 -0700
Cc: k-kooi@ti.com, denys@ti.com
Subject: question on meta-ti for yocto
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
X-List-Received-Date: Wed, 21 Mar 2012 14:58:45 -0000
Content-Type: multipart/alternative; boundary=f46d043c7ed820af6904bbc207e5

--f46d043c7ed820af6904bbc207e5
Content-Type: text/plain; charset=ISO-8859-1

Dear Sirs,

I am dumping this mail to ask for some clarifications. I am looking closely
to yocto as environment for
building embedded linux distro for omap based boards.

In particular, I do have AM3517 and DM3730 custom boards to support.

I am seeing that TI has made available meta-ti on yocto git that looks like
a good starting point for me.

But at same time the readme.txt does spot incompatibilities with the
current yocto structure and points
to open embeded and angstron layers.

I am confused. When do you plan full compatibility with yocto?

Would the gcc-4.5 toolchain grant full compatibility with neon?

I am asking this because other players such as Denx (with its own ELDK
www.denx.de) are providing an armv7a based on gcc-4.6
that I could test with "CFLAGS= -march=armv7-a -fno-tree-vectorize
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon"
and observe operating fine on AM3517.

I am wondering what is the best way to go:

- attempt integrating meta-ti with yocto for portions I need (davinci
support for sure on DM3730)
- or stick with meta-ti as it is and develop my own recipes for custom hw
as meta-ti bsp.

Thanks in advance for your time.

Regards,
Marco Monguzzi

--f46d043c7ed820af6904bbc207e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Sirs,<div><br></div><div>I am dumping this mail to ask for some clarif=
ications. I am looking closely to yocto as environment for=A0</div><div>bui=
lding embedded linux distro for omap based boards.</div><div><br></div><div=
>
In particular, I do have AM3517 and DM3730 custom boards to support.</div><=
div><br></div><div>I am seeing that TI has made available meta-ti on yocto =
git that looks like a good starting point for me.</div><div><br></div><div>
But at same time the readme.txt does spot incompatibilities with the curren=
t yocto structure and points=A0</div><div>to open embeded and angstron laye=
rs.</div><div><br></div><div>I am confused. When do you plan full compatibi=
lity with yocto?</div>
<div><br></div><div>Would the=A0gcc-4.5 toolchain grant full compatibility =
with neon?=A0</div><div><br></div><div>I am asking this because other playe=
rs such as Denx (with its own ELDK <a href=3D"http://www.denx.de">www.denx.=
de</a>) are providing an armv7a based on gcc-4.6</div>
<div>that I could test with &quot;CFLAGS=3D -march=3Darmv7-a -fno-tree-vect=
orize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon&quot;</div><div>a=
nd observe operating fine on AM3517.</div><div><br>I am wondering what is t=
he best way to go:</div>
<div><br></div><div>- attempt integrating meta-ti with yocto for portions I=
 need (davinci support for sure on DM3730)</div><div>- or stick with meta-t=
i as it is and develop my own recipes for custom hw as meta-ti bsp.</div>
<div><br></div><div>Thanks in advance for your time.</div><div><br>Regards,=
</div><div>Marco Monguzzi</div>

--f46d043c7ed820af6904bbc207e5--
