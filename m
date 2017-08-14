Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C753AE00D2B; Sun, 13 Aug 2017 20:02:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 544EEE00A9C
	for <meta-ti@yoctoproject.org>; Sun, 13 Aug 2017 20:02:14 -0700 (PDT)
Received: by mail-pg0-f45.google.com with SMTP id l64so37828744pge.5
	for <meta-ti@yoctoproject.org>; Sun, 13 Aug 2017 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=QZ6Y7tiOqso3In9/QqVeDCMsojY/JrgdkCBx3tkwPVg=;
	b=g1cvuHVBJDwW/jw/fUe2DXZ8qyaoA1tFKzEHx7Sh0K0WthXVETFBrEcuhuOIJpdLdb
	018/tdlRCXr9eVIk0pUy2o1Ho5JMg+AfftXlrmOULvPAGTeqxB7IHmiSajZg3vR/1WBo
	FQDpQQ/Eqd+RwP6XKqjkNLLIzSA0lvzn6qNxMsGcXZ3vSKH40L8JHc43/0etGipf9uIE
	C/LNxepP6SFUD26TXobhpnGJYCtb4OyLozCU3xjtf9Wy3e1EI8psWiQjqkqowqcZ4vT/
	w8GKYBqZdIZ6bv8Lxa5oVQ1Nmta86WFXNBtZ3172QHUK0or76Jvefh/b2n1Z4mbLwGHN
	U7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=QZ6Y7tiOqso3In9/QqVeDCMsojY/JrgdkCBx3tkwPVg=;
	b=XYt2yY7vRaL2lIHifAvTTwavqftHo6GURjrbjt1nncJ8/TRfEt9/OcnfnJBb8Nxk1/
	KLKifq5JHcs6vJpbqIW0xro55Kxyhg9oD6QRbMJzVN1oinEhcJaAaAceGIreUS5JDDFR
	3qKs3xPKew2DjKvpQ6da0IfR1U1BVB6+GlHBuN+BWxZdy7k4EBaXzEat95HdZyDogQ+T
	ThV/jEUJ0rpgZ5ckHEr1r0JuiqxB5q0Y8b3d+k5VzWO79nuZgvm4+NUm04ByO8IykhuW
	EwoEntQuQYCFeuxP2e1SoX5yEShJR9qV7DtJiorbxZp8vOwG8Ny0gG4zfRyG768wtdiu
	aleg==
X-Gm-Message-State: AHYfb5iHaGTMb2uOWz+fkaUkT/0CQuU/eVitaSTG/36zMDqxYNu8yhDl
	kJS4hbpreMxhlcfsKGo=
X-Received: by 10.84.209.165 with SMTP id y34mr26286098plh.200.1502679734029; 
	Sun, 13 Aug 2017 20:02:14 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:7ae4:ff:fe2d:ca29?
	([2001:8003:804a:b500:7ae4:ff:fe2d:ca29])
	by smtp.gmail.com with ESMTPSA id
	j124sm12069293pfc.78.2017.08.13.20.02.12
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 20:02:13 -0700 (PDT)
To: "N:" <meta-ti@yoctoproject.org>
From: Riko <antonius.riko@gmail.com>
Message-ID: <40df3ebc-437e-88c8-fa05-0acb504215c1@gmail.com>
Date: Mon, 14 Aug 2017 11:02:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
Subject: 8 bit port in AM335X
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
X-List-Received-Date: Mon, 14 Aug 2017 03:02:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dear TI Members,

How can I use 8 bit ports as one byte ? I want to use it as D0-D7 for 
LCD 16x2,

Thanks,

Riko


