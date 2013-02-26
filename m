Return-Path: <trini@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 93F19E0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:27:07 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QKR6ep000555
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:27:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKR6Lp003932
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:27:06 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 14:27:06 -0600
Received: from [172.24.52.55] (h52-55.vpn.ti.com [172.24.52.55])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKR5QC012353;
	Tue, 26 Feb 2013 14:27:05 -0600
Message-ID: <512D1ABB.4080304@ti.com>
Date: Tue, 26 Feb 2013 15:27:39 -0500
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Hernandez, Carlos" <ceh@ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com>
	<32B5D12402BE454796026F6AC58AA86E2E71F333@DLEE09.ent.ti.com>
In-Reply-To: <32B5D12402BE454796026F6AC58AA86E2E71F333@DLEE09.ent.ti.com>
X-Enigmail-Version: 1.5
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 20:27:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/26/2013 03:13 PM, Hernandez, Carlos wrote:
>> I haven't seen the keystone patches yet, so I don't know if the GPH
>> image is "special" in terms of headers, but the build target
>> u-boot-with-spl.bin is the canonical build target for "put
>> u-boot-spl.bin and u-boot.bin together".
>>
> 
> The current test script transfers (via UART) u-boot-spl.bin and then u-boot.img. 
> Have anybody tried booting one omap or sitara device using 'u-boot-with-spl.bin' image.

No, because none of the boot modes that take u-boot-spl.bin would like
to see a concatenated image like that.  That build target is primarily
used on other (vendors) platforms.

-- 
Tom

