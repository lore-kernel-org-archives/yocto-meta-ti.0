Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA5E5E0080D; Thu,  7 Aug 2014 05:47:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F4091E00801
	for <meta-ti@yoctoproject.org>; Thu,  7 Aug 2014 05:47:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77ClFup030972
	for <meta-ti@yoctoproject.org>; Thu, 7 Aug 2014 07:47:15 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77ClFsY008903
	for <meta-ti@yoctoproject.org>; Thu, 7 Aug 2014 07:47:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 7 Aug 2014 07:47:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-ti] [PATCH] am57xx-evm: Update the config name used in
	U-boot for this board
Thread-Index: AQHPscwxPomxt/lhv0WcweUPfgio75vFF7iA
Date: Thu, 7 Aug 2014 12:47:14 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1ACFB1@DLEE11.ent.ti.com>
References: <1407363057-18975-1-git-send-email-fcooper@ti.com>
	<20140806231351.GM23523@edge>
In-Reply-To: <20140806231351.GM23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] am57xx-evm: Update the config name used in U-boot for this board
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
X-List-Received-Date: Thu, 07 Aug 2014 12:47:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
>Sent: Wednesday, August 06, 2014 6:14 PM
>To: Cooper Jr., Franklin
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH] am57xx-evm: Update the config name
>used in U-boot for this board
>
>On Wed, Aug 06, 2014 at 05:10:57PM -0500, Franklin S. Cooper Jr
>wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>>  conf/machine/am57xx-evm.conf |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-
>evm.conf
>> index 56b1873..0beed60 100644
>> --- a/conf/machine/am57xx-evm.conf
>> +++ b/conf/machine/am57xx-evm.conf
>> @@ -8,7 +8,7 @@ IMAGE_FSTYPES +=3D "ubi tar.gz"
>>
>>  SERIAL_CONSOLE =3D "115200 ttyO2"
>>
>> -UBOOT_MACHINE =3D "dra7xx_evm_config"
>> +UBOOT_MACHINE =3D "beagle_x15_config"
>
>What's the actual difference in settings?

This handles differences in the mux settings, DDR timings, etc.

>
>
>>  # UBI information.  Note that this is board and kernel
>specific.  Changes
>>  # in your kernel port may require changes in these variables.
>For more
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

