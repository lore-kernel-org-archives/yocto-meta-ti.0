Return-Path: <wmills@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F1DE003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 03:16:36 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q23BGZIQ005582;
	Sat, 3 Mar 2012 05:16:35 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q23BGZX7029617;
	Sat, 3 Mar 2012 05:16:35 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 3 Mar 2012 05:16:34 -0600
Received: from [172.24.0.30] (gtengapp01.am.dhcp.ti.com [158.218.100.228])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q23BGXrW032552;
	Sat, 3 Mar 2012 05:16:34 -0600
Message-ID: <4F51FD84.7050101@ti.com>
Date: Sat, 3 Mar 2012 06:16:20 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20120301212837.C08F852A8A@arago-project.org>	<50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>	<351DB87E-545E-479E-8183-C5072355906C@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1012F04A6C0@DLEE12.ent.ti.com>	<20120302221439.GD24667@denix.org>
	<20120303082350.GF24667@denix.org>
In-Reply-To: <20120303082350.GF24667@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Sat, 03 Mar 2012 11:16:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2012 03:23 AM, Denys Dmytriyenko wrote:
> As a side note, sstate seems to be really broken, as building the first
> machine in a clean setup works fine, but then trying to build a second machine
> in the same setup leads to weird breakages in perl, gcc-cross-initial,
> gcc-cross-intermediate, then binutils etc. Even though both machines are
> armv7a and supposed to share those packages w/o rebuilding them... Cleaning
> sstate and/or entire build takes too much time and is really painful
> switching between platforms.
>

Please report this on oe-core list if you have not already.

