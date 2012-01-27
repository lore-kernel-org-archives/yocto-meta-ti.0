Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45DDCE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:24:02 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH00C484O1LKF2@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 14:24:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 481AF202E0; Fri,
	27 Jan 2012 15:24:01 -0500 (EST)
Date: Fri, 27 Jan 2012 15:24:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Message-id: <20120127202401.GF8707@denix.org>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2302F8.1000307@ti.com>
	<CA+M6bXkiXcO7EJ2wzwX1ROte8PhJfz2_12s1pDy8aUi+FTWPPw@mail.gmail.com>
	<20120127201127.GD8707@denix.org> <4F2306E8.4010306@balister.org>
MIME-version: 1.0
In-reply-to: <4F2306E8.4010306@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 27 Jan 2012 20:24:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 03:19:52PM -0500, Philip Balister wrote:
> On 01/27/2012 03:11 PM, Denys Dmytriyenko wrote:
> > On Fri, Jan 27, 2012 at 01:10:22PM -0700, Tom Rini wrote:
> >> On Fri, Jan 27, 2012 at 1:03 PM, William Mills <wmills@ti.com> wrote:
> >>> OK this part is off list.
> >>>
> >>> Go look at meta-intel and then look at the meta-ti your guys are purposing.
> >>>   Now, your an engineer in a hurry and you need to choose between intel ATOM
> >>> and TI ARM.  Which one looks simpler, clearer, and well organized.  Which do
> >>> you want to use?
> >>
> >> The problem we have here is that one of them (meta-intel) is "just use
> >> poky and this" and one of them is "just use angstrom and meta-oe and
> >> this".  And we need to figure out which use cases we want to support,
> >> and how.
> > 
> > "Just use poky and this" is also a valid use case for us.
> > 
> 
> But not for me. I need recipes from meta-oe to ship USRP-E100's and it
> is nice having binary feeds available for customer use. (Angstrom adds
> binary feeds to the mix).

It always possible to add-on stuff. But it's not so easy to remove. Remember 
how awfully huge and messy Classic OE was... Layers were supposed to fix that!

-- 
Denys

