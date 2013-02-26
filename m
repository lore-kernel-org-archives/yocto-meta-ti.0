Return-Path: <trini@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 64A31E0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:26:07 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QKQ6hd032415
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:26:06 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKQ6XW002887
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:26:06 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 14:26:06 -0600
Received: from [172.24.52.55] (h52-55.vpn.ti.com [172.24.52.55])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKQ50C012134;
	Tue, 26 Feb 2013 14:26:05 -0600
Message-ID: <512D1A7F.7030806@ti.com>
Date: Tue, 26 Feb 2013 15:26:39 -0500
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Cyril Chemparathy <cyril@ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com> <512D12D0.7090804@ti.com>
	<512D1714.6040805@ti.com>
In-Reply-To: <512D1714.6040805@ti.com>
X-Enigmail-Version: 1.5
Cc: meta-ti@yoctoproject.org, ceh@ti.com
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
X-List-Received-Date: Tue, 26 Feb 2013 20:26:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/26/2013 03:12 PM, Cyril Chemparathy wrote:
> On 02/26/2013 02:53 PM, Murali Karicheri wrote:
>> + Cyril,
>>
>> Cyril had worked on adding GPH format for u-boot. Want to hear from him
>> why not used the u-boot-with-spl.bin build target.
>>
> 
> Because u-boot-with-spl.bin does not wrap the spl image with a header
> that the rom bootloader understands.

What is the header we need?  I assume it's not compatible with our
previous headers.  And if it's just a convenience for programming the
flash, maybe we just stick with two files, to avoid further headaches
upstream?  It's a general rule that concatenating files would make
programming easier, but it's a small savings on either end, yes?  This
would also make the packaging easier since it would just be
SPL_IMAGE_FILE (or whatever) set to u-boot-spl.gph and so forth.  Thanks!

-- 
Tom

