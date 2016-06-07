Return-Path: <maciejjo@maciejjo.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61F4AE00BCE; Tue,  7 Jun 2016 05:39:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 304 seconds by postgrey-1.32 at yocto-www;
	Tue, 07 Jun 2016 05:39:33 PDT
Received: from fireball.maciejjo.pl (fireball.maciejjo.pl [51.255.199.218])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF800E00B5F
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 05:39:33 -0700 (PDT)
Received: from [10.154.112.29] (unknown [62.159.77.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by fireball.maciejjo.pl (Postfix) with ESMTPSA id 0756920CBF
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 14:34:26 +0200 (CEST)
To: meta-ti@yoctoproject.org
From: Maciej Sobkowski <maciejjo@maciejjo.pl>
Message-ID: <8038bced-7ae3-e0d2-56f1-f0f3e364b108@maciejjo.pl>
Date: Tue, 7 Jun 2016 14:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: ti-cgt-pru-native fails to build
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
X-List-Received-Date: Tue, 07 Jun 2016 12:39:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all,

I am currently trying to create load for PRU core on Beaglebone Black. I
have some PASM code I want to compile and copy to root filesystem.

I added following directive to my recipe:

DEPENDS = "ti-cgt-pru-native"

but the build of ti-cgt-pru-native fails with QA errors complaining
about wrong license files:

ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: QA Issue: ti-cgt-pru-native: LIC_FILES_CHKSUM points to an invalid file:
/home/maciejjo/yocto/build-glibc/work/x86_64-linux/ti-cgt-pru-native/2.1.1-r0/ti-cgt-pru-2.1.1/ti-cgt-pru_2.1.1/LICENSE.txt [license-checksum]
ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: Fatal QA errors found, failing task.
ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: Function failed: do_qa_configure ERROR: Logfile of failure stored in:
/home/maciejjo/yocto/build-glibc/work/x86_64-linux/ti-cgt-pru-native/2.1.1-r0/temp/log.do_configure.88
ERROR: Task 1028 (virtual:native:/home/maciejjo/devel/openembedded/project/build/meta-ti/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb,
do_configure) failed with exit code '1'

Are there any additional steps needed to be done before building this
recipe, or is this an error in file location?

And more importantly, is what I'm trying to do the correct method for
building PRU applications with meta-ti?

Br,

-- 
Maciej Sobkowski


