Return-Path: <trini@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06E59E00723
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 13:17:51 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q41KHoI6018549;
	Tue, 1 May 2012 15:17:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q41KHoPT022955;
	Tue, 1 May 2012 15:17:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 1 May 2012 15:17:50 -0500
Received: from [172.24.52.93] (h52-93.vpn.ti.com [172.24.52.93])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q41KHocO000905;
	Tue, 1 May 2012 15:17:50 -0500
Message-ID: <4FA044ED.4050404@ti.com>
Date: Tue, 1 May 2012 13:17:49 -0700
From: Tom Rini <trini@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<1335899212-29869-5-git-send-email-koen@dominion.thruhere.net>
	<20120501192352.GB26889@bill-the-cat>
	<C157B16C-6127-4B10-9EA2-4FA0D2F532DB@dominion.thruhere.net>
In-Reply-To: <C157B16C-6127-4B10-9EA2-4FA0D2F532DB@dominion.thruhere.net>
X-Mailman-Approved-At: Tue, 01 May 2012 14:52:48 -0700
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 5/5] u-boot 2011.12: switch beagleboard to ext4 to match beaglebone
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
X-List-Received-Date: Tue, 01 May 2012 20:17:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 12:30 PM, Koen Kooi wrote:
>
> Op 1 mei 2012, om 21:23 heeft Tom Rini het volgende geschreven:
>
>> On Tue, May 01, 2012 at 09:06:52PM +0200, Koen Kooi wrote:
>>> Also add patch to increase ext2 read speed.
>>>
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>
>> Acked-by: Tom Rini<trini@ti.com>
>
> FWIW, I'm tempted to get the latest uboot up and running before sending the final patchset. Any opinions on that?

v2012.04.1 for beagleboard, omap3evm and so forth should be nice. 
am335x is still just bare-bones.

-- 
Tom

