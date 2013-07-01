Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC277E0140D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 05:33:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61CXeSr018787
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:33:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61CXe1j008100
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:33:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 07:33:40 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r61CXcYi013763;	Mon, 1 Jul 2013 07:33:39 -0500
Message-ID: <51D17721.1070705@ti.com>
Date: Mon, 1 Jul 2013 18:03:37 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <20130701083045.GA4253@ti.com>
	<7D46E86EC0A8354091174257B2FED1015962AE50@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015962AE50@DLEE11.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipes-bsp: u-boot: Add GLSDK Staging tree
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
X-List-Received-Date: Mon, 01 Jul 2013 12:33:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 7/1/2013 5:08 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>> Sent: Monday, July 01, 2013 3:31 AM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] [PATCH] recipes-bsp: u-boot: Add GLSDK Staging
>> tree
>>
>> * The GLSDK u-boot staging tree is based off the Core SDK
>> 2013.04.02
>>  release. This tree will be used to stage patches and fixes on
>>  top of the Core SDK U-Boot. The GLSDK release will use this tree
>>  for product development.
>> * Includes fix to OMAP5 so that QSPI is not enabled.
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> .../u-boot/u-boot-glsdk-staging_2013.01.01.bb      |   16
>> ++++++++++++++++
>> 1 files changed, 16 insertions(+), 0 deletions(-)
>> create mode 100644 recipes-bsp/u-boot/u-boot-glsdk-
>> staging_2013.01.01.bb
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>> b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>> new file mode 100644
>> index 0000000..90d2d61
>> --- /dev/null
>> +++ b/recipes-bsp/u-boot/u-boot-glsdk-staging_2013.01.01.bb
>> @@ -0,0 +1,16 @@
>> +require u-boot-ti.inc
>> +
>> +DESCRIPTION = "u-boot bootloader for TI devices supported by the
>> GLSDK product"
>> +
>> +PR = "r1+gitr${SRCPV}"
> 
> You can start at r0.  Please make sure if you are finding issues with the base u-boot sources you are feeding those back so that hopefully your need for this recipe eventually dies.

Right. Tom's aware of the patches and we have his review of the bug done
as well. I'll fix the PR and send v2.

> 
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +
>> +SRC_URI = "git://git.ti.com/glsdk/glsdk-u-
>> boot.git;protocol=git;branch=${BRANCH}"
>> +
>> +BRANCH ?= "master"
>> +
>> +SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
>> +
>> +SPL_BINARY = "MLO"
>> +SPL_UART_BINARY = "u-boot-spl.bin"
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


