Return-Path: <ebutera@gmail.com>
Received: from mail-vx0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15B01E01412
	for <meta-ti@yoctoproject.org>; Fri,  4 May 2012 05:16:22 -0700 (PDT)
Received: by vcbf1 with SMTP id f1so977354vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 04 May 2012 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=jvOiZDOkS40ZrEG8bvhTMi5G7mu2NEbCwIUewxAATX4=;
	b=MQIvDrvu753C2QmQ3hIqMa3O6r8/Rx9+W9OGKvaKSMqSURWQoZdwk5e1wPjJhvj+wj
	Ps5323cvKowVLVisNCgok6ODzhXnrV/Kp/5XEY61jUJEPUJeZdY5QA71yKTSxbO5YLT1
	5nh2JrosgxvzIuhuPTxJC2rZhcyntv+J+CKQTV8N17L+o2b7AxfK7Ge7ttJjz2LKm8v5
	/ukLPEGKzXP8u8kPRlutvxnoyZcEtzRKcTiH5V2HMPMY8NvZH0GRzMl2VRzTj9TSTN1o
	6qvsJzryVhMqUs0iE5DOIh+cBAjW2F0brdyfKe9X144iQLVxmxRuSThUlMailQPHnc1t
	V/Eg==
MIME-Version: 1.0
Received: by 10.220.117.203 with SMTP id s11mr3761880vcq.33.1336133782186;
	Fri, 04 May 2012 05:16:22 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.148.68 with HTTP; Fri, 4 May 2012 05:16:22 -0700 (PDT)
Date: Fri, 4 May 2012 14:16:22 +0200
X-Google-Sender-Auth: d23udG8WGQDZnKywnCQdzGx4d8U
Message-ID: <CA+2YH7srjOf900PBFzxVx8Tm4HKaxuvKzKudoo201Bh7-48o6g@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Subject: ti-dsplink build error
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
X-List-Received-Date: Fri, 04 May 2012 12:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

i'm having a build error problem with ti-dsplink, clean
"angstrom-v2012.05-yocto1.2" checkout from yesterday:

ERROR: Error executing a python function in
/stuff/setup-scripts-denzil/sources/meta-ti/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb:
TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "split_and_strip_files", line 204, in <module>
ERROR:
ERROR:   File "split_and_strip_files", line 198, in split_and_strip_files
ERROR:
ERROR:   File "package.bbclass", line 30, in runstrip
ERROR:
ERROR: The code that was being executed was:
ERROR:      0200:       # End of strip
ERROR:      0201:       #
ERROR:      0202:
ERROR:      0203:
ERROR:  *** 0204:split_and_strip_files(d)
ERROR:      0205:
ERROR: (file: 'split_and_strip_files', lineno: 204, function: <module>)
ERROR:      0194:               for root, dirs, files in os.walk(dvar):
ERROR:      0195:                       for f in files:
ERROR:      0196:                               if not f.endswith(".ko"):
ERROR:      0197:                                       continue
ERROR:  *** 0198:
runstrip(os.path.join(root, f), None, d)
ERROR:      0199:       #
ERROR:      0200:       # End of strip
ERROR:      0201:       #
ERROR:      0202:
ERROR: (file: 'split_and_strip_files', lineno: 198, function:
split_and_strip_files)
ERROR: Function failed: split_and_strip_files


if i set INHIBIT_PACKAGE_STRIP (to skip that part) i have no errors.

Build host: ubuntu 11.10 32bit

OE Build Configuration:
BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "igep0020"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.05"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     =
"angstrom-v2012.05-yocto1.2:cdd62d0afbc8048eebc24a9f19e5e1ae5bfed5bb"
meta-oe
toolchain-layer
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    = "denzil:5a06d2a2f504eadc5c7babcbcd833cf3763315ee"
meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         = "master:3386ea6c96096f107f43f282f654e5afa456109e"
meta-mozilla      = "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
meta-chromium     = "master:172783d6567d30429786291e401594d46f40cd69"
meta-mono         = "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
meta-kde          = "master:88b105c2b4a2bed318f54115be1eaad717498823"
meta-ti           = "master:2585c8864b5ba85c9aa1fe81e21e771173125b97"
meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         = "master:2b106be01228f64298d6cb338f93088806594344"
meta-handheld     = "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-fri2
meta-jasperforest
meta-n450         = "master:f75f9b6f68473eb0efac802409608f8389be0030"
meta-igep         = "master:55f393a669c98b8fe49ce650ce51969318f28fd8"
meta              = "denzil:5433da972f2994f7176597d89499ccb65f876f88"


Any ideas?

Enrico

