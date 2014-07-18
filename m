Return-Path: <rpjday@crashcourse.ca>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7250BE006EF; Fri, 18 Jul 2014 04:50:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [208.80.206.84 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 211 seconds by postgrey-1.32 at yocto-www;
	Fri, 18 Jul 2014 04:50:18 PDT
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B335E0056A
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 04:50:18 -0700 (PDT)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140718114645729
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 11:46:45 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <meta-ti@yoctoproject.org>
Received: from [99.240.204.5] (port=51335 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X86cZ-0006OG-I8
	for meta-ti@yoctoproject.org; Fri, 18 Jul 2014 07:46:39 -0400
Date: Fri, 18 Jul 2014 07:46:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.LFD.2.11.1407180737270.9890@localhost>
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
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: curious about libdrm-2.4.41 recipe from meta-ti layer
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
X-List-Received-Date: Fri, 18 Jul 2014 11:50:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i was perusing a number of yocto layers looking for cool examples to
use in an upcoming class and ran across this oddity in the meta-ti
layer:

recipes-graphics/drm/libdrm_2.4.41.bb:
  FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"

  in all of the layers i've looked at, that is the only example of
*appending* to FILESEXTRAPATHS i've ever seen, so i thought i'd look
closer to see what was going on.

  even though oe-core defines a libdrm recipe file, the meta-ti layer
doesn't use a bbappend for its version. rather, it explicitly adds the
libdrm/ directory from oe-core using a reference to ${COREBASE}, then
adds its own files. that's valid, i guess, it just looks weird and is
the only time i've ever seen that.

  i'm also puzzled that the meta-ti recipe sets:

DEFAULT_PREFERENCE = "-1"

what's that for?  given that the oe-core layer already defines a
recipe for libdrm that has a higher version number, why would the
above line be necessary?

  just trying to understand the rationale behind this unusual
construction.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


