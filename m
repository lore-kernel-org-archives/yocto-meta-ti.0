Return-Path: <fabio@bertux.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACF45E00576; Mon,  7 Jul 2014 17:06:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11101E00566
	for <meta-ti@yoctoproject.org>; Mon,  7 Jul 2014 17:06:40 -0700 (PDT)
Received: by mail-qc0-f171.google.com with SMTP id w7so4680217qcr.30
	for <meta-ti@yoctoproject.org>; Mon, 07 Jul 2014 17:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=JiiWDSoy1tAyyqkPJ+qBkejdkDhZYTEl6NX/oXc111k=;
	b=Jq7shNq3YTzZhccSoM+v8cVnlUwRR+woAzHrwUjhF/SHNNcL3pdUjYKXUR9B5x22pp
	JqIO3J2mT6wgLy2stVvGfqZp0k0jYGzV3W5dO0OenDWfcSMmB99bPlerqJwQ+v4yb5Jz
	y/WaWjLWgJEMwm8r5YKT19NGXfLCWwY/HzHOyPbvXGnKwPLBifp+Cp+wdWdUaybWvnw4
	euyoW2ymdj+a8YBD0IddrTAeGDzyYHFQoJ6BT5FwsA50X1tTES/QH8fiM7DaI/soo1qv
	sV0ZVsgIufUvEuMxHfszpM8HJb3tCLn3IxQlWF/e0iq0BZPDEPEbCe31GCdu1LfiQWfF
	xGHQ==
X-Gm-Message-State: ALoCoQmVpy3Thr7FXMXocfU14iNb6oXci7JIj1AgKRGNoRic5TrXTzl0gBawkVjOXtL0JjX1ZW87
X-Received: by 10.224.49.71 with SMTP id u7mr53707272qaf.58.1404777999222;
	Mon, 07 Jul 2014 17:06:39 -0700 (PDT)
Received: from [192.168.0.102]
	(200-96-120-221.smace701.dsl.brasiltelecom.net.br. [200.96.120.221])
	by mx.google.com with ESMTPSA id t3sm77288200qai.28.2014.07.07.17.06.38
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jul 2014 17:06:38 -0700 (PDT)
Message-ID: <53BB360C.3050001@bertux.com>
Date: Mon, 07 Jul 2014 21:06:36 -0300
From: Fabio Berton <fabio@bertux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Qt5 + egl display
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
X-List-Received-Date: Tue, 08 Jul 2014 00:06:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I'm trying to build an image for my bbb with Qt5 and egl support. I'm 
using meta-ti and meta-qt5 layers. I made an image and appended 
omap3-sgx-modules and libgles-omap3 to my image install. I get this 
modules loaded: bufferclass_ti, omaplfb, pvrsrvkm. But when I run 
Qt5_CinematicExperience -platform eglfs, I get this message:  Could not 
initialize egl display Aborted.
The kernel version is 3.12.20.
Do I need to install anything else? Or I'm making a mistake?

Thanks!

