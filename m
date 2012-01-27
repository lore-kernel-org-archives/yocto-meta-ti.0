Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7C62E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:20:11 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKK9Y8014701;
	Fri, 27 Jan 2012 14:20:09 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKK9cv018123;
	Fri, 27 Jan 2012 14:20:09 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 14:20:09 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RKK8P3021635;	Fri, 27 Jan 2012 14:20:09 -0600
Message-ID: <4F2306F8.3040901@ti.com>
Date: Fri, 27 Jan 2012 15:20:08 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2302F8.1000307@ti.com>
	<CA+M6bXkiXcO7EJ2wzwX1ROte8PhJfz2_12s1pDy8aUi+FTWPPw@mail.gmail.com>
	<20120127201127.GD8707@denix.org>
In-Reply-To: <20120127201127.GD8707@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Darren Hart <dvhart@linux.intel.com>
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
X-List-Received-Date: Fri, 27 Jan 2012 20:20:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/27/2012 03:11 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 27, 2012 at 01:10:22PM -0700, Tom Rini wrote:
>> On Fri, Jan 27, 2012 at 1:03 PM, William Mills<wmills@ti.com>  wrote:
>>> OK this part is off list.
>>>
>>> Go look at meta-intel and then look at the meta-ti your guys are purposing.
>>>    Now, your an engineer in a hurry and you need to choose between intel ATOM
>>> and TI ARM.  Which one looks simpler, clearer, and well organized.  Which do
>>> you want to use?
>> The problem we have here is that one of them (meta-intel) is "just use
>> poky and this" and one of them is "just use angstrom and meta-oe and
>> this".  And we need to figure out which use cases we want to support,
>> and how.
> "Just use poky and this" is also a valid use case for us.

Yes, but Tom has a point.  I was hoping meta-ti could be an example of 
how a Si vendor could publish their stuff for the OE ecosystem in 
general w/o a poky, angstrom,  etc bias.  Maybe convince the intel guys 
they should look at doing the same.  The more stuff we pile into this 
the harder it is to see that message.





