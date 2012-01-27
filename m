Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AD35E0030F
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 14:40:43 -0800 (PST)
Received: (qmail 22888 invoked by uid 1003); 27 Jan 2012 22:40:41 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Jan 2012 22:40:41 -0000
Message-ID: <4F2327E7.5050205@balister.org>
Date: Fri, 27 Jan 2012 17:40:39 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<4F230E21.9010405@balister.org> <20120127205717.GI8707@denix.org>
In-Reply-To: <20120127205717.GI8707@denix.org>
X-Enigmail-Version: 1.1.2
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
X-List-Received-Date: Fri, 27 Jan 2012 22:40:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2012 03:57 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 27, 2012 at 03:50:41PM -0500, Philip Balister wrote:
>> On 01/27/2012 03:24 PM, William Mills wrote:
....


>>> Chase: your right.  I do not want to follow intel's example of layer per
>>> BSP.
>>
>> I build stuff for the USRP E100 (based on a gumstic overo). I use my own
>> later for BSP that provides kernel, u-boot, and image recipes.
>>
>> I still need a TI BSP layer for DSP stuff (we do not care about SGX,
>> although it is possible customers could).
>>
>> Do forget your customers using all this to ship products.
>>
> Philip,
> 
> I don't understand what you are arguing here about or against? :)
> 
> It won't change much for you, maybe just setup step a little.
> 
> The proposal above is to split meta-ti and meta-arago repositories into 
> multiple layers inside those repositories, like meta-oe already does.
> 
> Your example above is a good one - having BSP, DSP and SGX in 3 separate 
> layers allows you to enable first two w/o the need to get the second one 
> parsed or used.
> 

Mostly I am saying keep your customers in mind, I very much like the
story of oe-core as the foundation, adding meta-oe to build images that
can be tested in qemu, using the TI BSP to support SOC specific features
and as an example to create my own BSP with my image definitions.
Finally I can use the Angstrom layer to provide some sanity to package
versions and as a source for binary feeds. I'm not sure where Arago fits
in this story.

It would be really nice to get all this sorted out so we can clearly
explain this to other users of TI products and OE users.

Philip

