Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B04FDE01389
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 08:09:23 -0800 (PST)
Received: by mail-ie0-f175.google.com with SMTP id aq17so1105040iec.6
	for <meta-ti@yoctoproject.org>; Thu, 07 Nov 2013 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cEcjRBB9uKwLkJpSwmTnfIEAi5uKtOzhY2OrFT+VMm0=;
	b=iCBiSdXif8hKdIBaOdLOBk8199CobPKAN/tAIWmqLiBjzB5FHZbhGKWO5WDBiCazUV
	Nn1HwXRgiLc0wUj2MUvBQbEJOt5pRfHULBWDXDAUA1GatiDRH/LSaUr3b2lo9pKxRCvl
	1H1pFs6DJtERtquIHcqMePUS2rXUAGHuxeaKLpaaFWQBRVAHRXBeXBkoBbC4hGTECbKd
	uOUWXYMYNR8sMLRgQjEypDFlIixRWEuVUrIgxlLZ8IhiDXAZLGYyXVeIc+V0mYBCF3YT
	Oy3HLbswhP9/fYljtTXMYkGBlYAKBkyq8axpcAWvAgqdvP5C8XkIjv/psmdpDfDeKRam
	cRcg==
X-Received: by 10.42.54.132 with SMTP id r4mr5744294icg.19.1383840562386; Thu,
	07 Nov 2013 08:09:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Thu, 7 Nov 2013 08:08:52 -0800 (PST)
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5981BF@DFLE08.ent.ti.com>
References: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C5981BF@DFLE08.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Nov 2013 08:08:52 -0800
Message-ID: <CAMKF1sp9GcggTzqLQZkCTo7WJsbF=xX5_90uOJe47Ft2hJS7KA@mail.gmail.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 07 Nov 2013 16:09:23 -0000
Content-Type: text/plain; charset=UTF-8

yes. whatever recipe is specific to machines/socs they should use this
kind of things

On Thu, Nov 7, 2013 at 7:27 AM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
> Should we mimic these changes to the other versions of this recipe? Although, DEFAULT_PREFERENCE is set to -1 for all the other recipes it will make sure we avoid this issue again in the future.
>
>
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Khem Raj
>> Sent: Wednesday, November 06, 2013 10:53 PM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] [PATCH] omap3-sgx-modules: Enable is only for relevant
>> machines
>>
>> When layers is parsed in multi-bsp layer distros and a non-omap/non-arm
>> machine is used this causes parse failures
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> index 31c7d4e..79b73cb 100644
>> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
>> @@ -10,6 +10,13 @@ BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
>>
>>  inherit module
>>
>> +COMPATIBLE_HOST_omap3 = ".*"
>> +COMPATIBLE_HOST_omap4 = ".*"
>> +COMPATIBLE_HOST_ti814x = ".*"
>> +COMPATIBLE_HOST_ti816x = ".*"
>> +COMPATIBLE_HOST_ti33x = ".*"
>> +COMPATIBLE_HOST ?= "(none)"
>> +
>>  MACHINE_KERNEL_PR_append = "b"
>>  PR = "${MACHINE_KERNEL_PR}"
>>
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

