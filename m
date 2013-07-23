Return-Path: <michael@amarulasolutions.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F412E013E8
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:09:37 -0700 (PDT)
Received: by mail-we0-f172.google.com with SMTP id t61so2563286wes.17
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 13:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent:x-gm-message-state;
	bh=ONpIHiOMlLCV9z0FlHx6ZfSgy6SbhFYhAvjoYSls/pk=;
	b=j61KFjmDC+TrSP5xTkSSvpgy0wRRasznbkHQayuwkY8Zwj0QJvovoP5HRdeaL83rag
	ZWUWfhPRpju7Q+D/KxGeGvY+hadt97NK+xV4WJ9Igo8CCb/SdJZ+bvHKJ/yC2LZxE6sG
	XZt/HABhqt7+pBav+ye2PRm6pXAKjG5eqY9sp4BVD8nq+MT/tWJkJ/KZ2IOzCsACZTO3
	gsamK7uCRHkJQ/M3kFfW2vMxP1x0CTCr79gF+JpRI4Yq6fKd6ZopnVf4KWdCWT4ULcXe
	JdDx2hB/3dPEi9ZjegBnWZ7XvWKz4jmHpLvKhbH9+bHmdIf+hSc9Or8r0eGCjRHw9mW6
	BwYA==
X-Received: by 10.194.108.132 with SMTP id hk4mr24464709wjb.43.1374610176423; 
	Tue, 23 Jul 2013 13:09:36 -0700 (PDT)
Received: from panicking (net-2-39-208-255.cust.dsl.vodafone.it.
	[2.39.208.255])
	by mx.google.com with ESMTPSA id mb20sm737141wic.1.2013.07.23.13.09.34
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 13:09:35 -0700 (PDT)
Date: Tue, 23 Jul 2013 22:09:31 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: meta-ti@yoctoproject.org
Message-ID: <20130723200931.GA10067@panicking>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQlRkYnlbWe2ZzGO0TambwVhoUepy3r8vkVRdGcCkhZ6Wu+b44gL4BNpDBe80tHp54lqKHj/
Subject: Unable to compile am180x-evm + gstreamer-ti
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
X-List-Received-Date: Tue, 23 Jul 2013 20:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I was having trouble in compilation of am180x-evm. The problem is that
I have this error:

Nothing PROVIDES 'ti-codecs-omapl138'. I'm using HOB right now and I
have included meta-ti repository. Any hints?

Best Regards
Michael

