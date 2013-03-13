Return-Path: <liljegren.mats2@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62C62E00709
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 09:23:37 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id jf20so551700bkc.7
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=y+GwBlkjSaxc8AlZ+d2q7wyZELnLC4FoVbQMEgprmXk=;
	b=MFFl0en34wuy/ZzAcoIYYddMkzVxekN0PL3gmacLEjsIE2JWLrSp8AWypjTf7xxnk2
	+laNQyIF62K5TxmFr7veSqp8b9PY1qvohK10N5VO/gVyjEdPCZLqWtEtrUqC4bqrbMzg
	lpG6meBWBkcfadEw2e1PD6Pkdj+KgUXxejaKckX+2Awm5dF5ACejFmOEtV/o/LOHvAb/
	niYzLq/QsLR8Xu4iQ2bj4nMzDTryIIB5lDZ/38Zadeyt3VKJ7YLm0cgVNnSEH23D3Avi
	soNOJRfFeeYw0TxIywpYvQeK38c2iwRVgJXoIciruOFncicaqPr/iFhDzc4Z6Dg+F6yM
	CuSg==
X-Received: by 10.204.183.198 with SMTP id ch6mr7879513bkb.90.1363191815909;
	Wed, 13 Mar 2013 09:23:35 -0700 (PDT)
Received: from enea.se (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id o2sm6222026bkv.3.2013.03.13.09.23.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:23:35 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:23:33 +0100
From: Mats Liljegren <liljegren.mats2@gmail.com>
To: meta-ti@yoctoproject.org
Message-ID: <20130313162332.GA17056@enea.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: License errors
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
X-List-Received-Date: Wed, 13 Mar 2013 16:23:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When I bitbake with meta-ti layer I get the following errors:

ERROR: This recipe does not have the LICENSE field set (cloud9-image)
ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)
ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image)
ERROR: Unable to parse
/media/sdc1/fb/mlil/enea-base/poky/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb: Exited with "1"--:--:--
ERROR: Command execution failed: Exited with 1

I use master branch for poky as well as for meta-ti.

Is there a fix for this already, or should I create a patch for it? If the
latter, what license should I use? MIT?

Regards
Mats Liljegren

