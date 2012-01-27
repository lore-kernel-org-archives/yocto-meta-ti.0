Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE462E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:09:49 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH002W63ZNYUX1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 14:09:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 08352202E0; Fri,
	27 Jan 2012 15:09:22 -0500 (EST)
Date: Fri, 27 Jan 2012 15:09:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120127200922.GC8707@denix.org>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
	<FCA44E54-9FAC-4905-86BE-C5A50092A880@dominion.thruhere.net>
	<20120127193923.GB8707@denix.org>
	<FF4B271D-2A5F-4DFF-B784-B94980454611@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <FF4B271D-2A5F-4DFF-B784-B94980454611@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 27 Jan 2012 20:09:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 08:47:29PM +0100, Koen Kooi wrote:
> 
> Op 27 jan. 2012, om 20:39 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > On Fri, Jan 27, 2012 at 01:24:14PM +0100, Koen Kooi wrote:
> >> 
> >> Op 27 jan. 2012, om 13:09 heeft Andreas M?ller het volgende geschreven:
> >> 
> >>> On Fri, Jan 27, 2012 at 12:50 PM, Koen Kooi <koen@dominion.thruhere.net> 
> >>> wrote:
> >>>> Since meta-arago is supposed to be as empty as possible and matrix 
> >>>> doesn't play well with others it's a bad fit for both meta-arago and 
> >>>> meta-oe. Maybe we should split the meta-ti repo into 2 layers: one for 
> >>>> BSP things (including sgx, dsp, etc) and one for 'sdk' things (matrix).
> >>>> The idea is to keep reusable TI deliverables together without forcing 
> >>>> people to use arago. Putting matrix in meta-arago would mean you can only 
> >>>> use it with DISTRO=arago, which is a huge step backwards from the current 
> >>>> situation.
> >>> 
> >>> I think splitting out BSP into an own layer is a good idea and sorry
> >>> for another hijacking: This would be a good chance to make it
> >>> independent of angstrom ( e.g ti-hw-bringup ).
> >> 
> >> Image reuse is the least of the issues, SOC_FAMILY is a much larger one.
> > 
> > Koen,
> > 
> > Can you please elaborate on the SOC_FAMILY issue you mentioned? Thanks.
> 
> We need support for it, only angstrom does at the moment. The big problem is 
> that the solution can't be layer-local since other layers will use it as 
> well. Having duplicates in OVERRIDES is a nightmare.

Adding SOC_FAMILY into MACHINEOVERRIDES portion of OVERRIDES and making sure 
sstate recognizes it...

Why not push this change to OE-Core?

-- 
Denys

