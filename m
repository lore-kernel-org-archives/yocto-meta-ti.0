Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3491E01757
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:52:06 -0800 (PST)
Received: by mail-pa0-f41.google.com with SMTP id rd3so966872pab.14
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 09:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GDXUrokDVruJnCugoQ2zihXakZ6RfuzWRtbzFr2ohQg=;
	b=XnSODRgrEgxaATpufL8uvIR3QxEZxLlwGRwcetfNt4hmXgqpSyNcPqLUi4jrpMnAx3
	ofF6vRUFQGrlhVT7rWvkVEbRUIpjZ0VKNYSnUgfxZGykBBKw3Z7oVzqNTEe+7/SJ3Ryr
	dGL7d2cHl3anTnXqP9ppdXkE7yHiI/XRqHIlSozuDYoEwce6RobjUeTQJSAq4ASH+87J
	kL8JKRW65IJc6GjrVEdY3MajQ0aDngS2bgI29CN8uIzSfkKcsbNqcxhcwi8dGmtvh9rp
	ThaKOpaAxovXcVS/QWrqHMxziYJewZXv2Vqe5hAtHx8A52r/Ij8mm0p95d6wytoJ8F9D
	dDWw==
X-Received: by 10.66.188.80 with SMTP id fy16mr11137662pac.168.1383846725926; 
	Thu, 07 Nov 2013 09:52:05 -0800 (PST)
Received: from [192.168.0.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209]) by mx.google.com with ESMTPSA id
	qp10sm7942428pab.13.2013.11.07.09.52.05 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 09:52:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131107174349.GQ4510@edge>
Date: Thu, 7 Nov 2013 09:52:03 -0800
Message-Id: <DB47B555-91BF-4360-A48E-FF0E4B56F948@gmail.com>
References: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
	<20131107174349.GQ4510@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1816)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] omap3-sgx-modules: Enable is only for relevant machines
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
X-List-Received-Date: Thu, 07 Nov 2013 17:52:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 9:43 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Nov 06, 2013 at 08:52:48PM -0800, Khem Raj wrote:
>> When layers is parsed in multi-bsp layer distros and
>> a non-omap/non-arm machine is used this causes parse
>> failures
>=20
> Can you be more specific with the parse errors? I don't want a real =
issue (if=20
> any) to be simply masked away=85

my logs for parse fails are now overwritten but another case where this =
fails for me is this
MACHINE=3Dqemuppc bitbake -k world when meta-ti is included in your =
distro. It will fail to build


>=20
>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb | 7 =
+++++++
>> 1 file changed, 7 insertions(+)
>>=20
>> diff --git =
a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb =
b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> index 31c7d4e..79b73cb 100644
>> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> @@ -10,6 +10,13 @@ BINFILE :=3D =
"Graphics_SDK_setuplinux_${SGXPV}.bin"
>>=20
>> inherit module
>>=20
>> +COMPATIBLE_HOST_omap3 =3D ".*"
>> +COMPATIBLE_HOST_omap4 =3D ".*"
>> +COMPATIBLE_HOST_ti814x =3D ".*"
>> +COMPATIBLE_HOST_ti816x =3D ".*"
>> +COMPATIBLE_HOST_ti33x =3D ".*"
>> +COMPATIBLE_HOST ?=3D "(none)"
>> +
>> MACHINE_KERNEL_PR_append =3D "b"
>> PR =3D "${MACHINE_KERNEL_PR}"
>>=20
>> --=20
>> 1.8.3.2
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


