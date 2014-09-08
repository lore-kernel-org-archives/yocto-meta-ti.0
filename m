Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF414E00846; Sun,  7 Sep 2014 17:11:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [62.149.158.236 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtpdg11.aruba.it (smtpdg6.aruba.it [62.149.158.236])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4719E007A2
	for <meta-ti@yoctoproject.org>; Sun,  7 Sep 2014 17:11:25 -0700 (PDT)
Received: from [192.168.1.69] ([94.33.39.20])
	by smtpcmd04.ad.aruba.it with bizsmtp
	id oQBM1o00K0S5K6601QBMnR; Mon, 08 Sep 2014 02:11:22 +0200
Message-ID: <540CF429.3040608@phoenixsoftware.it>
Date: Mon, 08 Sep 2014 02:11:21 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: HTML5 crash
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
X-List-Received-Date: Mon, 08 Sep 2014 00:11:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I'm trying to render a HTML5 website with QT5 demo browser available in 
tisdk-rootfs-image.
The repository is fully updates.
The board is AM335x Starter Kit.

The websites user for tests are:
- html5-benchmark.com
- html5test.com
- peacekeeper.futuremark.com

No matter the website I chooes, I always get a SIGSEV with following 
backtrace:

#0  0xb49b7128 in WTFCrash () from /usr/lib/libQt5WebKit.so.5
#1  0xb48f3c28 in JSC::evaluate(JSC::ExecState*, JSC::SourceCode const&, 
JSC::JSValue, JSC::JSValue*) () from /usr/lib/libQt5WebKit.so.5
#2  0xb37ac654 in 
WebCore::ScriptController::evaluateInWorld(WebCore::ScriptSourceCode 
const&, WebCore::DOMWrapperWorld*) () from /usr/lib/libQt5WebKit.so.5
#3  0xbefff16c in ?? ()
#4  0xbefff16c in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Does anyone experienced a similar behavior?
Do you have any suggestion on how to approach the problem?

Thanks
Regards
Pierluigi


