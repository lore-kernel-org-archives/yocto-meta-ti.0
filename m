Return-Path: <rpjday@crashcourse.ca>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB0A7E00559; Tue,  8 Jul 2014 08:07:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53CB3E00547
	for <meta-ti@yoctoproject.org>; Tue,  8 Jul 2014 08:07:17 -0700 (PDT)
Received: from [69.196.158.250] (port=34752 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X4WzE-0000Iy-8c; Tue, 08 Jul 2014 11:07:16 -0400
Date: Tue, 8 Jul 2014 11:07:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: "Maupin, Chase" <chase.maupin@ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D120CD5@DLEE11.ent.ti.com>
Message-ID: <alpine.LFD.2.11.1407081106170.6090@localhost>
References: <alpine.LFD.2.11.1407071749530.7024@localhost>
	<7D46E86EC0A8354091174257B2FED1015D120CD5@DLEE11.ent.ti.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: logicpd zoom am1808 experimenter kit versus am1809 evm?
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
X-List-Received-Date: Tue, 08 Jul 2014 15:07:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 8 Jul 2014, Maupin, Chase wrote:

> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Robert P. J. Day
> >Sent: Monday, July 07, 2014 5:04 PM
> >To: meta-ti mailing list
> >Subject: [meta-ti] logicpd zoom am1808 experimenter kit versus
> >am1809 evm?
> >
> >
> >  i have in front of me a logicpd zoom AM1808 eXperimenter kit:
> >
> >  http://www.logicpd.com/products/system-on-modules/zoom-am1808/
> >
> >and i notice that meta-ti has support for the am180x-evm, where
> >the
> >EVM is this beast:
> >
> >  http://www.logicpd.com/products/system-on-modules/zoom-am1808-
> >evm/
> >
> >as best i can tell, the EVM is just the eXp kit with the added UI
> >expansion board, would that be correct? so it seems that i can use
> >the
> >meta-ti layer and build for an am180x-evm to get a working system
> >for
> >my eXp kit, yes?
>
> I believe that will get you close.  But you may need to use dylan
> branch as I think Dora and Daisy don't support this device well
> anymore.

  so i'm guessing that that particular processor is getting a bit
dated, and has been superseded by ... what?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

