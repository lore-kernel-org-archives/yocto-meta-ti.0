Return-Path: <wmills@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BF44E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:42:58 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKgvaN014290;
	Fri, 27 Jan 2012 14:42:57 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKgvM1019418;
	Fri, 27 Jan 2012 14:42:57 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 14:42:57 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RKgu7s027548;	Fri, 27 Jan 2012 14:42:56 -0600
Message-ID: <4F230C50.8070400@ti.com>
Date: Fri, 27 Jan 2012 15:42:56 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
	<20120127203433.GG8707@denix.org>
	<7D46E86EC0A8354091174257B2FED1010BF9D9FE@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9D9FE@DLEE12.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:42:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/27/2012 03:39 PM, Maupin, Chase wrote:
>>
>> -----Original Message-----
>> From: Denys Dmytriyenko [mailto:denis@denix.org]
>> As of today's state of Arago - if you don't count recipes/ti, which
>> was
>> "untouchable" for some special reasons, everything else is quite
>> clean with
>> using amends everywhere possible! And our of all the people you
>> should know
>> this better.
> There are plenty of recipes in arago outside of the ti directory that are not just amends.  What I am saying is that I would like to split the bbappends into their own directory so that we can more easily track what we are appending and ideally find ways to drive those changes into lower common layers (not that we always can)
>

So it can be even clearer and cleaner than it is today.  Great.  Sounds 
like a good task for a meta-arago owner.



