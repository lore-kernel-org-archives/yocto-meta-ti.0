Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FE5EE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:35:00 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKYxJr012280;
	Fri, 27 Jan 2012 14:34:59 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKYxOH008534;
	Fri, 27 Jan 2012 14:34:59 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 14:34:58 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RKYw3m025824;	Fri, 27 Jan 2012 14:34:58 -0600
Message-ID: <4F230A72.5090609@ti.com>
Date: Fri, 27 Jan 2012 15:34:58 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:35:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit


On 01/27/2012 03:29 PM, Maupin, Chase wrote:
>> On 01/27/2012 03:21 PM, Denys Dmytriyenko wrote:
>> How about splitting meta-ti into:
>>> * BSP only
>>> * SGX graphics
>>> * DSP tools
>>> * WiFi etc.
>>>
>>> And then splitting meta-arago into:
>>> * Arago distro for TI SDKs
>>> * Supplemental apps
>>>
>> Need to get my "YES!" in here before everyone barfs all over the
>> proposal :)
> I'm good with this.  I was also planning in meta-arago to at least put all bbappends in a recipes-appends directory so it was easy to track the things we are "tweaking" vs. the recipes.  Arago today is too much of a mix between amends and recipes in my opinion.  I would even say that Tom's proposal (from IRC) of splitting the arago distro and supplemental apps into two layers would be a good idea so that other distros can pull our supplemental apps if they want pretty easily.  And that way we don’t keep adding more repos to manage.

Yes, this is what I was talking about all along.  Sorry if I was not clear.


