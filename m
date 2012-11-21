Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBF8DE0127C
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 08:06:05 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qALG643V025437;
	Wed, 21 Nov 2012 10:06:04 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qALG64D1002005;
	Wed, 21 Nov 2012 10:06:04 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 21 Nov 2012 10:06:04 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qALG64W7016653;
	Wed, 21 Nov 2012 10:06:04 -0600
Date: Wed, 21 Nov 2012 11:06:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Leon Woestenberg <sidebranch.openembedded@gmail.com>
Message-ID: <20121121160603.GA11734@edge>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<CAMvUbCxkwWxBO_LqYgkjL0Kdq0QAuO4yLmmFv_SumrpMnegohw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMvUbCxkwWxBO_LqYgkjL0Kdq0QAuO4yLmmFv_SumrpMnegohw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Wed, 21 Nov 2012 16:06:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 21, 2012 at 02:09:24PM +0100, Leon Woestenberg wrote:
> Hello Cliff, all,
> 
> On Fri, Nov 16, 2012 at 10:56 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> 
> >
> > Uncompressing Linux... done, booting the kernel.
> >
> > (nothing more)
> >
> >
> I have tried to read through the whole thread and understand if there was
> convergence on what the probable cause could be, but as I could not find
> one.
> Without intending to capture this thread:
> 
> I just experience the same on my TI AM 3730 board when I moved the

It cannot be the same, since we were discussing a problem with Cliff's 
pandaboard, which is omap4.


> poky-denzil layer to the poky-danny layer and moved meta-ti to latest
> (HEAD). I redid the whole build from scratch, and experienced the same
> problem.
> My kernel recipe is outside of meta-ti, so either I am picking up a faulty
> toolchain for ARM, or I am including something from meta-ti that changed.
> 
> Might be unrelated to your problem.

Are you saying you use your own kernel? Have you tried one of the kernels from 
meta-ti?

-- 
Denys

