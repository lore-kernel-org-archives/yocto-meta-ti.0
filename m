Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18D78E005A9; Wed,  7 Jan 2015 10:41:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.235 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61726E002F9
	for <meta-ti@yoctoproject.org>; Wed,  7 Jan 2015 10:41:51 -0800 (PST)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-06.prod.phx3.secureserver.net with 
	id d6hp1p00A0BVjqb016hqU7; Wed, 07 Jan 2015 11:41:50 -0700
Message-ID: <54AD7DF5.1040805@pabigot.com>
Date: Wed, 07 Jan 2015 12:41:57 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: linux-ti-staging broken in oe-core master
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
X-List-Received-Date: Wed, 07 Jan 2015 18:41:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The recent churn in how kernel source is managed apparently makes 
meta-ti/linux-ti-staging-3.14 unusable with oe-core master. One gets:

NOTE: make omap2plus_defconfig
make: *** No rule to make target `omap2plus_defconfig'.  Stop.
ERROR: oe_runmake failed

possibly because the source isn't where it used to be.

Just a FYI.  There's ongoing discussion about this on oe-core 
(http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg60146.html) 
which TI folks might want to participate in.

Peter

