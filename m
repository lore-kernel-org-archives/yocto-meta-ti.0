Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10EFBE00D19; Fri, 15 Dec 2017 14:44:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A083E00CE8
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 14:44:20 -0800 (PST)
Received: by mail-it0-f46.google.com with SMTP id p139so22440453itb.1
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 14:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:mime-version
	:content-transfer-encoding;
	bh=jy7fh4dIGorYq19bQacgQyqfBL6BmTlcJj/hh8jEd4Q=;
	b=a2fDMUjanbBW2xfiYknamoX/FVRLeoBVizOovywyetxRrviNXvQuA1B/qIvzQfeCiK
	YfiEVjvG9mDcVrOFedWXdLpumvlCdf9eejqGbFg1f5IXndzUJeL+pDQhURrosnoI5fo4
	TVGpOBu/HvDRc2E6vq4jmMj0dvUG/8SwI4UkiI2Isv8ikPXQIBOaRdnDBs2sUEiccF2Y
	3A5H9ppNmoN35kQgD8IkH8HolgljBb6fP45a5sbJL9n3jjNjn+LFh6KqscSXhuI3qfvN
	GPkhq6sNyEI4Kug4eXJCkQFxw/oyl2YuCigQQdBpNpzPudBYo8Spxa03MycMJdPI3n8D
	n5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:mime-version
	:content-transfer-encoding;
	bh=jy7fh4dIGorYq19bQacgQyqfBL6BmTlcJj/hh8jEd4Q=;
	b=qkYWT4CJVfyL+oEKws5+d3ziScD35WE61wfYNkQR+jb0b9zDa1MI6wlXk7r5tO92Q9
	IQcLH3WzxHf0rosmDQRo2YUIYCv9VFITbrZI6Duj4dSbMdIXuD0oRJkaw/zI4/Kgc2uf
	OSZBq1QULPAbNY3U1H+wptM12wmx7HEXxlZkU0bYkNdACB+HOvJ9cnrsHpmL5FyfabVl
	nMNXLtH2cDc6TUjz0pPqz5XKdnzwbxvs4gQYtaxfFsZT/wyzCLzbP/6NT1rw0eH7nWSi
	vVvIS0+q9+REATMNckccnDpV9//lcXaJxJMA9cDK6mCnpNiwW1ZYbXBOF0PWycPir96T
	WkHQ==
X-Gm-Message-State: AKGB3mJ5dKp9B8VSDgWL2z0+BFLP3VtH36VnhpM8gHRSaAZjJp0uf67D
	+tQ4Uf1kB04O6GBrXFWM2y6XZSOi
X-Google-Smtp-Source: ACJfBottqIWTzWzd9FSNZ9nPQHH1+R4wqs0ps7X70oP1ADm+q0l39HISi1UuYR+6leAVz6fmzZLDNA==
X-Received: by 10.36.4.72 with SMTP id 69mr10140845itb.33.1513377859977;
	Fri, 15 Dec 2017 14:44:19 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	o73sm10030673ito.4.2017.12.15.14.44.18 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Dec 2017 14:44:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513377846.13604.8.camel@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Fri, 15 Dec 2017 16:44:06 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Subject: No GLESv1 support on Morty?
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
X-List-Received-Date: Fri, 15 Dec 2017 22:44:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I'm attempting to build an application that uses the PVR GLESv1
libraries (ti-sgx-ddk-um) off of the morty branch. However, it appears
that when I call  eglGetConfigs(), it doesn not return any GLESv1
compatible configs, and so eglChooseConfigs() failes to find one that
works. I have printed out the configs that are returned and it looks
like all of them are GLESv2 only:

Config 0x1:                       
        color=8,8,8               
        alpha=8                   
        depth=24                  
        type=(0x4) GLESv2         
Config 0x2:                       
        color=8,8,8               
        alpha=8                   
        depth=0                   
        type=(0x4) GLESv2         
Config 0x3:                       
        color=8,8,8               
        alpha=8                   
        depth=24                  
        type=(0x4) GLESv2         
Config 0x4:                       
        color=8,8,8               
        alpha=0                   
        depth=24                  
        type=(0x4) GLESv2         
Config 0x5:                       
        color=8,8,8               
        alpha=0                   
        depth=0                   
        type=(0x4) GLESv2         
Config 0x6:                       
        color=8,8,8               
        alpha=0                   
        depth=24                  
        type=(0x4) GLESv2         
Config 0x7:                       
        color=5,6,5               
        alpha=0                   
        depth=24                  
        type=(0x4) GLESv2         
Config 0x8:                       
        color=5,6,5               
        alpha=0                   
        depth=0                   
        type=(0x4) GLESv2         
Config 0x9:                       
        color=5,6,5               
        alpha=0                   
        depth=24                  
        type=(0x4) GLESv2

I made sure I was linking against libGLES_CM and libEGL (but *not*
libGLESv2). I beleive this same code worked on the daisy branch.

Is there something I'm missing to enable GLESv1 support?

Thank,
Joshua Watt

