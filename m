Return-Path: <twoerner@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09679E0086D; Wed,  8 Apr 2015 14:54:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (twoerner[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.173 listed in list.dnswl.org]
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE928E007A0
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2015 14:54:04 -0700 (PDT)
Received: by iebmp1 with SMTP id mp1so86394854ieb.0
	for <meta-ti@yoctoproject.org>; Wed, 08 Apr 2015 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=TCWkLdJW72K9cepHEX5XB5RhYIO1++SCASc0oGAW4ck=;
	b=vhlZpDmJLwB0hq7QuyD/R8SkuZY37HM2zCxq68AQFZP/dS8AY3Bbgl2qnFxa5EhRA2
	slkjFsiqLzIdZSJTgaBm0anxk6r2RdWNzPqpP4rF3GDLPBUq2Io8ie7IyO0+cErEdJF8
	enb9A6G6C+23qTeiUZ4AiF4jq4orMcB5GGgeEeaH9ku3oLSRCfSQzRqaGKhEFUrk29GA
	zeLj5oCLzMlsF2VOBE7Gx1GEVC0JErmTM48cbczhqOo6mWc561XzLNveB+BpZMLaz6nR
	Ana1c4uNak2rwi50zbi0YSm/JgOPww/9EpIluylMsvUMIE6dOb0pE4Vah+RrV0ZK3J0d
	2FyQ==
X-Received: by 10.107.32.73 with SMTP id g70mr42292098iog.55.1428530043654;
	Wed, 08 Apr 2015 14:54:03 -0700 (PDT)
Received: from [192.168.34.210] (static-66-11-92-234.ptr.terago.net.
	[66.11.92.234])
	by mx.google.com with ESMTPSA id 9sm7512341iom.29.2015.04.08.14.54.02
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 14:54:02 -0700 (PDT)
Message-ID: <5525A37A.70503@gmail.com>
Date: Wed, 08 Apr 2015 17:54:02 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: dizzy branch
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
X-List-Received-Date: Wed, 08 Apr 2015 21:54:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Is there going to be a dizzy branch to meta-ti?

