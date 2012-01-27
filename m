Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57F51E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:19:54 -0800 (PST)
Received: (qmail 24953 invoked by uid 1003); 27 Jan 2012 20:19:53 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Jan 2012 20:19:53 -0000
Message-ID: <4F2306E8.4010306@balister.org>
Date: Fri, 27 Jan 2012 15:19:52 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2302F8.1000307@ti.com>	<CA+M6bXkiXcO7EJ2wzwX1ROte8PhJfz2_12s1pDy8aUi+FTWPPw@mail.gmail.com>
	<20120127201127.GD8707@denix.org>
In-Reply-To: <20120127201127.GD8707@denix.org>
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
X-List-Received-Date: Fri, 27 Jan 2012 20:19:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2012 03:11 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 27, 2012 at 01:10:22PM -0700, Tom Rini wrote:
>> On Fri, Jan 27, 2012 at 1:03 PM, William Mills <wmills@ti.com> wrote:
>>> OK this part is off list.
>>>
>>> Go look at meta-intel and then look at the meta-ti your guys are purposing.
>>>   Now, your an engineer in a hurry and you need to choose between intel ATOM
>>> and TI ARM.  Which one looks simpler, clearer, and well organized.  Which do
>>> you want to use?
>>
>> The problem we have here is that one of them (meta-intel) is "just use
>> poky and this" and one of them is "just use angstrom and meta-oe and
>> this".  And we need to figure out which use cases we want to support,
>> and how.
> 
> "Just use poky and this" is also a valid use case for us.
> 

But not for me. I need recipes from meta-oe to ship USRP-E100's and it
is nice having binary feeds available for customer use. (Angstrom adds
binary feeds to the mix).

Philip

