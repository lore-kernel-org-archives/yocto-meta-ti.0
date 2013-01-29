Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01DB3E00294
	for <meta-ti@yoctoproject.org>; Tue, 29 Jan 2013 13:59:06 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33690 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0JCr-0006pv-8f
	for meta-ti@yoctoproject.org; Tue, 29 Jan 2013 16:59:05 -0500
Date: Tue, 29 Jan 2013 16:58:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301291653410.14129@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: error, building ti-hw-bringup-image for am180x-evm: "... ofono.service does not exist"
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
X-List-Received-Date: Tue, 29 Jan 2013 21:59:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  trying to build a ti-hw-bringup-image for a am180x-evm, got through
quite a bit of the build when:

ERROR: Function failed:
For package ofono-systemd SYSTEMD_SERVICE-entry ofono.service does not exist

  from what i read, that package is being pulled in via a dependency
in connman.  and recently, there was a change in oe-core related to
ofono:

$ git show 1766f851be890ec057040594a12997b1576ba1d5
commit 1766f851be890ec057040594a12997b1576ba1d5
Author: Marko Lindqvist <cazfi74@gmail.com>
Date:   Tue Jan 15 13:54:03 2013 +0200

    ofono: replace obsolete automake macros with working ones

    Add obsolete_automake_macros.patch that replaces automake macros
    no longer supported by automake-1.13 with modern constructs.

    Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>


that's as far as i've got digging into this -- thoughts on why the
ofono.service file is missing?  did this once work?  where is
ofono.service supposed to come from?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

