Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE28C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:27:11 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.750.1748446024682661889
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 May 2025 08:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sXU7kelj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SFR22c3289549;
	Wed, 28 May 2025 10:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748446022;
	bh=d8jkdegsPQsgBDa/uZZfeUlgk8x4xiEnaS/+tiEK26I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sXU7keljkpmTsjWxMs/NOJafgo5FDqYoJojJgfvaZQfLaiZCDTMvKu7sDi+kC/l2w
	 0gbtTRtp3hlqstvOcgCGXpWYsj5yLwj7aAliR1Vv8MklkLW3GC+zrOHxjcwv0WlUuW
	 pZHnBRXH6KITi3BNlt3jkEk2zbAkhEQPzbblqhJA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SFR29N3656046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 10:27:02 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 10:27:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 10:27:01 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54SFR17H122025;
	Wed, 28 May 2025 10:27:01 -0500
Message-ID: <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
Date: Wed, 28 May 2025 10:27:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH 2/2] Add rpmsg DMA library and simple DSP
 offload example
To: Denys Dmytriyenko <denis@denix.org>, Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250528102653.323423-1-p-bhagat@ti.com>
 <20250528102653.323423-2-p-bhagat@ti.com> <20250528151659.GP18383@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250528151659.GP18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 May 2025 15:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18604



On 5/28/2025 10:16 AM, Denys Dmytriyenko wrote:
> On Wed, May 28, 2025 at 03:56:53PM +0530, Paresh Bhagat wrote:
>> From: Vishnu Singh <v-singh1@ti.com>
>>
>> Add rpmsg DMA library and simple DSP offload example, based on rpmsg & DMA Heap
>> buffers. This includes librpmsg_dma.so shared library used for real-time audio
>> offloading to DSP from Linux, Ethernet based control utility etc.
>>
>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>> ---
>>   .../ipc/ti-librpmsg-dma-example_1.0.bb        | 28 +++++++++++++++++++
>>   .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 26 +++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>> new file mode 100644
>> index 00000000..8b01fa46
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "Audio Offload Example using RPMsg DMA"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
>> +
>> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
>> +SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "ti-librpmsg-dma fftw libsndfile1 alsa-lib ti-rpmsg-char"
> 
> See fftw comment below

My counter response... if this recipe depends on ti-librpmsg-dma, then 
does this recipe need to depend on fftw?  Same question for all of the 
other DEPENDS entries.  Does this recipe actually depend on all this 
other packages or just ti-librpmsg-dma?


Follow on question.. why do we have two recipes that are both pointing 
at the same repository?


> 
>> +
>> +do_compile() {
>> +	oe_runmake -C example/audio_offload
>> +}
>> +
>> +do_install() {
>> +	install -d ${D}${bindir}
>> +	install -m 0755 example/audio_offload/bin/audio_offload ${D}${bindir}/
>> +
>> +	install -d ${D}${sysconfdir}
>> +	install -d ${D}/opt
>> +	install -m 0644 example/audio_offload/config/dsp_offload.cfg ${D}${sysconfdir}/dsp_offload.cfg
>> +	install -m 0644 example/audio_offload/audio_sample/sample_audio.wav ${D}/opt/sample_audio.wav
>> +}
>> +
>> +FILES:${PN} += "${sysconfdir}/dsp_offload.cfg"
>> +FILES:${PN} += "/opt"
>> +FILES:${PN} += "/opt/sample_audio.wav"
> 
> Last 2 lines can be combined
> 
> 
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> new file mode 100644
>> index 00000000..666439dd
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "RPMsg DMA shared library"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
>> +
>> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
>> +SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "fftw libsndfile1 alsa-lib ti-rpmsg-char"
> 
> fftw is not in oe-core, but in meta-openembedded, and meta-ti does not depend
> on meta-openembedded

That's a problem then...  We don't want to blow up the requirements for 
building with just meta-ti-bsp (which a number of customers do).

Does this belong more in meta-ti-extras then?

> 
>> +
>> +do_compile() {
>> +	oe_runmake
>> +}
>> +
>> +do_install() {
>> +	install -d ${D}${libdir}
>> +	install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libdir}/
>> +	ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_dma.so.1
>> +	ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dma.so
>> +
>> +	install -d ${D}${includedir}/rpmsg_dma
>> +	install -m 0644 include/*.h ${D}${includedir}/rpmsg_dma/
>> +}
>> +
>> +INSANE_SKIP:${PN} += "dev-so"
> 
> Is it needed here? I see the versioned links are setup above, so this should
> not be needed...

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

