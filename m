Return-Path: <liljegren.mats2@gmail.com>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DC64E0071D
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 11:01:56 -0700 (PDT)
Received: by mail-bk0-f51.google.com with SMTP id ik5so601705bkc.24
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1DB4Db0G0i+KkYcgeyraCwSqQ5P8cW/MGxuCkEjvvRk=;
	b=Zz/CdvVxbaGafWEyQqVLSC3f50mn+gfBeRyVtvWHI/ht2edvlnSl3prtmN3v94WE7p
	OrnoNnglPoyhCW+R8HFbcZesb/QT3TQq3FlZzYZEC6I13wkTCtFNCdO02ARGplN47vW0
	zVYuKaXyxOM3g2bBmp2JXdxPt3xqDV7bCYkMJ+ekqbgAqy3Wk9Ej5O+iHsGuNoJLDMbc
	NoJG8dhKw6GrUdIIGVc86Pt72yT8GjQyrBDlcPLa2NLmCN+Zk6rcSwnwNwXIRmGvDDop
	4F8qapvz4O80rNlhfvWDMN4EMA2ZT0v2Jk8gKL02CXm0f/hLjzfUvPTzWEO2uhVtUMU5
	JFzA==
X-Received: by 10.205.102.202 with SMTP id df10mr8122865bkc.83.1363197714951; 
	Wed, 13 Mar 2013 11:01:54 -0700 (PDT)
Received: from enea.se (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id fs20sm6300879bkc.8.2013.03.13.11.01.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 11:01:54 -0700 (PDT)
Date: Wed, 13 Mar 2013 19:01:52 +0100
From: Mats Liljegren <liljegren.mats2@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20130313180151.GB17056@enea.se>
References: <20130313162332.GA17056@enea.se>
 <5140A8CE.4050209@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <5140A8CE.4050209@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: License errors
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
X-List-Received-Date: Wed, 13 Mar 2013 18:01:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Gary Thomas wrote:
> On 2013-03-13 10:23, Mats Liljegren wrote:
> >When I bitbake with meta-ti layer I get the following errors:
> >
> >ERROR: This recipe does not have the LICENSE field set (cloud9-image)
> >ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)
> >ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
> >ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image)
> >ERROR: Unable to parse
> >/media/sdc1/fb/mlil/enea-base/poky/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb: Exited with "1"--:--:--
> >ERROR: Command execution failed: Exited with 1
> >
> >I use master branch for poky as well as for meta-ti.
> >
> >Is there a fix for this already, or should I create a patch for it? If the
> >latter, what license should I use? MIT?
> 
> This is discussed in meta-ti/README

Missed that part in the README, thanks for the pointer!

Regards
Mats Liljegren

