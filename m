Return-Path: <ian.wisbon@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A40F1E01493
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 08:52:48 -0700 (PDT)
Received: from duckworth (192.168.3.31) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Thu, 28 Mar 2013 11:52:46 -0400
Date: Thu, 28 Mar 2013 11:52:47 -0400
From: "Ian M. Wisbon" <ian.wisbon@timesys.com>
To: meta-ti@yoctoproject.org
Message-ID: <20130328115247.029b68ae@duckworth>
Organization: Timesys Coporation
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: OMAP5: Booting build output
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
X-List-Received-Date: Thu, 28 Mar 2013 15:52:48 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hello,

I've completed a build for the OMAP5 uEVM using the meta-ti layer, and
was wondering whether there is any documentation for booting the
resulting output? Particular DIP switch settings, viable means of
booting - SD/USB/eMMC, particular formatting operations for SD, etc.

I am familiar with the documentation on OMAPpedia wrt OMAPBOOT, but I'm
not looking to boot/flash Android - and as you're building U-boot
MLO/img this doesn't seem applicable, but correct me if I am wrong. I
understand that the documentation may be limited/restricted at this
time, so if necessary I will contact the appropriate sources, or wait
until such time as documentation is released.

Regards,

--
---
Ian Wisbon
Support Manager
Timesys Corporation

