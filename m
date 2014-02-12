Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3889CE0074B
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 08:38:07 -0800 (PST)
Received: by mail-pa0-f45.google.com with SMTP id lf10so9418482pab.4
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=n4mOhhXCLg37W6QCS/UcAykCVmyZqCRISH6SV/Pfjpo=;
	b=kwILhdYz6vJgCRTNuHfmSSS8nBhtZp9ZpvhDMztUAO3pny6l6miQtYoJFzNoCFApMc
	MtMHOBl5PsrDxLkfKxvZnmV2gcnRrBGPPH29D4iljevXeTQ4BfNE/2qQVOaBMStXP2qb
	xe+pqxw7+/juMAX129p8SAM5PXnx3EGwswJKYcLwvSyx7etnzcplzx++4eKh18XVZQmw
	/tQuWZ5ZATzT9VS/pk5MhctavilMw4WYncyqeMOCEXki4ICKonthms0Dm6EdDaiq3T2A
	wV+QDlEESn/8GLnkEb8yQrZnkde1u+EoVyZYPWAcv45cqjCcJBtK0yvvXCsMxmXAyphe
	lcQQ==
X-Received: by 10.68.189.198 with SMTP id gk6mr23982034pbc.146.1392223087407; 
	Wed, 12 Feb 2014 08:38:07 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ns7sm65101502pbc.32.2014.02.12.08.38.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 08:38:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20140212162842.GF4346@edge>
Date: Wed, 12 Feb 2014 08:38:04 -0800
Message-Id: <24DEDB29-4F4C-48E9-9CB3-D1023ECBACD8@gmail.com>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
	<CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
	<FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
	<CAHB-Pj=_sDdkbd0qjZVAWVs0f7c1HMiwfMnm13Ckys-UocVL=A@mail.gmail.com>
	<20140212162842.GF4346@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1827)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
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
X-List-Received-Date: Wed, 12 Feb 2014 16:38:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Feb 12, 2014, at 8:28 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Feb 12, 2014 at 03:15:38PM +0100, Richard R=F6jfors wrote:
>> On Wed, Feb 12, 2014 at 3:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>>=20
>>> On Feb 12, 2014, at 6:03 AM, Richard R=F6jfors =
<richard.rojfors@gmail.com>
>>> wrote:
>>>=20
>>> On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>>=20
>>>> what incompatibilities do you see between 4.7 and 4.8 ?
>>>>=20
>>>=20
>>> I saw this in the gcc 4.8 changelog:
>>> "On ARM, a bug has been fixed in GCC's implementation of the AAPCS =
rules
>>> for the layout of vectors that could lead to wrong code being =
generated.
>>> Vectors larger than 8 bytes in size are now by default aligned to an =
8-byte
>>> boundary. This is an ABI change: code that makes explicit use of =
vector
>>> types may be incompatible with binary objects built with older =
versions of
>>> GCC. Auto-vectorized code is not affected by this change.=94
>>>=20
>>>=20
>>> OK. are you seeing this use case here ?
>>>=20
>>=20
>> Nope I've not hit it nor gone through the calls between the blobs and =
the
>> surrounding code.
>>=20
>> I just think it makes sense to compile the blobs with a compiler =
similar to
>> the one provided by oe-core, to avoid the risk...
>=20
> The biggest problem is not 4.7 vs. 4.8, but rather incompatibilities =
in ABIs=20
> and call conventions. E.g. we have switched to hardfp for our products =
and=20
> some of our components distributed in binary form are only available =
in hardfp=20
> format. And oe-core doesn't use hardfp by default yet=85
>=20

yes thats a genuine concern, so when you publish prebuilt components =
then demand
the required ABI compatibilities, but there isn=92t much else one can =
do.

> --=20
> Denys


